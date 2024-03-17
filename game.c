#include <stdio.h>
#include <stdlib.h>
#include "game.h"
#include "gba.h"
#include "mode0.h"
#include "subSprites.h"
#include "sprites.h"
#include "reefCollisionMap.h"
#include "sound.h"
#include "shot.h"

extern void goToLose();
extern void goToWin();
extern void goToInstructions();

enum
{
    START,
    INSTRUCTIONS,
    GAME,
    PAUSE,
    WIN,
    LOSE
};
extern int state;

// Variables
OBJ_ATTR shadowOAM[128];
SPRITE player;
SwordfishBoss swordfishBoss;
SwordfishBoss sword;
SPRITE torpedo;
Shark sharks[MAX_SHARKS];
Jellyfish jelly[JELLY_COUNT];

int hOff;
int vOff;
int hOff1;
int vOff1;
int playerHealth;
int swordfishHealth;
int stageTimer;
int shadowOAMIndex;
int torpedoFacing;
int cheatEnabled;
int reverseTimer;

typedef enum {LEFT, RIGHT} DIRECTION;

unsigned char* collisionMap;

inline unsigned char colorAt(int x, int y){
    // TODO 3.1: Delete the 0, and complete this function
    return collisionMap[OFFSET(x, y, MAPWIDTH)];
}

void initGame() {
    collisionMap = (unsigned char*) reefCollisionMapBitmap;
    DMANow(3, subSpritesPal, SPRITEPALETTE, 256);
    DMANow(3, subSpritesTiles, &CHARBLOCK[4], subSpritesTilesLen / 2);
    hOff = 50;
    vOff = 50;
    hOff1 = 0;
    vOff1 = 0;
    cheatEnabled = 0;
    playerHealth = 3;
    swordfishHealth = 5;
    stageTimer = 0;
    reverseTimer = 0;
    shadowOAMIndex = 0;
    initPlayer();
    initSwordfish();
    initTorpedo();
    initShark();
    initJellyfish();
}

void updateGame() {
    updatePlayer();
    updateSwordfish();
    updateTorpedo();
    updateShark();
    updateJellyfish();
    REG_BG0HOFF = hOff;
    REG_BG0VOFF = vOff;
    REG_BG1HOFF = hOff1;
    REG_BG1VOFF = vOff1;
}

void drawGame() {
    if (state != GAME) {
        return;
    }
    drawPlayer();
    drawSwordfish();
    drawTorpedo();
    drawShark();
    drawJellyfish();
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_4BPP | BG_SIZE_LARGE;
}

void initJellyfish() {
    for (int i = 0; i < JELLY_COUNT; i++) {
        jelly[i].width = 16;
        jelly[i].height = 16;
        jelly[i].numOfFrames = 3;
        jelly[i].timeUntilNextFrame = 15;
        jelly[i].frame = 0;
    }
    jelly[0].x = 130;
    jelly[0].y = 190;
    jelly[1].x = 420;
    jelly[1].y = 250;
    jelly[2].x = 180;
    jelly[2].y = 420;
}

void updateJellyfish() {
    for (int i = 0; i < JELLY_COUNT; i++) {
        if (collision(jelly[i].x, jelly[i].y, jelly[i].width, jelly[i].height, player.x, player.y, player.width, player.height)) {
            reverseTimer = 60;
        }
        jelly[i].timeUntilNextFrame--;
        if (jelly[i].timeUntilNextFrame == 0) {
            jelly[i].timeUntilNextFrame = 15;
            jelly[i].frame = (jelly[i].frame + 1) % jelly[i].numOfFrames;
        }
    }
    if (reverseTimer > 0) reverseTimer--;
}

void drawJellyfish() {
    for (int i = 0; i < JELLY_COUNT; i++) {
        if (jelly[i].y + jelly[i].height > vOff && jelly[i].y < SCREENHEIGHT + vOff) shadowOAM[60 + i].attr0 = ATTR0_Y(jelly[i].y - vOff) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[60 + i].attr1 = ATTR1_X(jelly[i].x - hOff) | ATTR1_SMALL;
        shadowOAM[60 + i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(23, jelly[i].frame * 2) | ATTR2_PRIORITY(0);
    }
}

void initPlayer() {
    player.x = 50;
    player.y = 50;
    player.dx = 0;
    player.dy = 0;
    player.width = 24;
    player.height = 16;
    player.numOfFrames = 2;
}

void updatePlayer() {
    if (BUTTON_PRESSED(BUTTON_LSHOULDER) && BUTTON_PRESSED(BUTTON_RSHOULDER) && !cheatEnabled) {
        cheatEnabled = 1;
    } else if (BUTTON_PRESSED(BUTTON_LSHOULDER) && BUTTON_PRESSED(BUTTON_RSHOULDER) && cheatEnabled) {
        cheatEnabled = 0;
    }
    int leftX = player.x;
    int rightX = player.x + player.width - 1;
    int topY = player.y;
    int bottomY = player.y + player.height - 1;
    
    if (BUTTON_HELD(BUTTON_UP) && player.y > 0) {
        if (!reverseTimer){
            player.y -= 2;
            vOff1--;    
        } else {
            player.y += 2;
            vOff1++;
        }
        if ((colorAt(player.x, player.y - player.dy) && !colorAt(player.x + player.width - 1, player.y - player.dy))) {
            playerHealth--;
            goToLose();
        }
    }
    if (BUTTON_HELD(BUTTON_DOWN) && player.y <= MAPHEIGHT - player.height) {
        if (!reverseTimer) {
            player.y += 2;
            vOff1++;
        } else {
            player.y -=2;
            vOff1--;
        }
        if (colorAt(player.x, player.y + player.height - 1 + player.dy) && !colorAt(player.x + player.width - 1,player.y + player.height - 1 + player.dy)) {
            playerHealth--;
            goToLose();
        }
    }
    if (BUTTON_HELD(BUTTON_LEFT) && player.x >= 0) {
        if (!reverseTimer) {
            player.x -= 2;
            player.direction = LEFT;
            hOff1--;
        } else {
            player.x +=2;
            player.direction = RIGHT;
            hOff1++;
        }
        if (colorAt(player.x - player.dx, player.y) && !colorAt(player.x - player.dx, player.y + player.height - 1)) {
            playerHealth--;
            goToLose();
        }
    }
    if (BUTTON_HELD(BUTTON_RIGHT) && player.x <= MAPWIDTH - player.width) {
        if (!reverseTimer) {
            player.x += 2;
            player.direction = RIGHT;
            hOff1++;
        } else {
            player.x -= 2;
            player.direction = LEFT;
            hOff1--;
        }
        if (colorAt(player.x + player.width - 1 + player.dx, player.y + player.height - 1) && !colorAt(player.x + player.width - 1 + player.dx, player.y)) {
            playerHealth--;
            goToLose();
        }
    }
    player.x += player.dx;
    player.y += player.dy;
    hOff = player.x - (SCREENWIDTH - player.width) / 2;
    vOff = player.y - (SCREENHEIGHT - player.height) / 2;
    if (hOff < 0) hOff = 0;
    if (vOff < 0) vOff = 0;
    if (hOff > MAPWIDTH - SCREENWIDTH) hOff = MAPWIDTH - SCREENWIDTH;
    if (vOff > MAPHEIGHT - SCREENHEIGHT) vOff = MAPHEIGHT - SCREENHEIGHT;
    if (swordfishBoss.active && collision(player.x, player.y, player.width, player.height, 
        swordfishBoss.x, swordfishBoss.y, swordfishBoss.width, swordfishBoss.height)) {
            goToLose();
    }
    if (swordfishBoss.active && collision(player.x, player.y, player.width, player.height, 
        sword.x, sword.y, sword.width, sword.height)) {
            goToLose();
    }
}

void drawPlayer() {
    shadowOAM[0].attr0 = ATTR0_Y(player.y - vOff) | ATTR0_4BPP | ATTR0_WIDE;
    if (player.direction == LEFT) {
        shadowOAM[0].attr1 = ATTR1_X(player.x - hOff) | ATTR1_MEDIUM | ATTR1_HFLIP;
    } else {
        shadowOAM[0].attr1 = ATTR1_X(player.x - hOff) | ATTR1_MEDIUM;
    }
    shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 0) | ATTR2_PRIORITY(0);
}

void initSwordfish() {
    swordfishBoss.x = 90;
    swordfishBoss.y = 370;
    swordfishBoss.dx = 0;
    swordfishBoss.dy = 0;
    swordfishBoss.width = 80;
    swordfishBoss.height = 32;
    swordfishBoss.numOfFrames = 4;
    swordfishBoss.timeUntilNextFrame = 5;
    swordfishBoss.frame = 0;
    swordfishBoss.active = 1;
    swordfishBoss.path = 0; //distance travelled in path
    swordfishBoss.direction = RIGHT;
    sword.direction = swordfishBoss.direction;
    sword.width = 16;
    sword.height = 8;
    sword.x = swordfishBoss.x + swordfishBoss.width - 16;
    sword.y = swordfishBoss.y + 16;
    swordfishBoss.currStage = IDLE;
}

void updateSwordfish() {
    //Will be able to chase player and have a state where it will pause to charge
    //and dash toward the player.
    if (swordfishBoss.hurt) swordfishBoss.hurt = 0;
    if (swordfishBoss.active && torpedo.active && collision(swordfishBoss.x, swordfishBoss.y, swordfishBoss.width, swordfishBoss.height,
        torpedo.x, torpedo.y, torpedo.width, torpedo.height)) {
            torpedo.active = 0;
            if (cheatEnabled) {
                swordfishHealth = 0;
            } else {
                swordfishHealth--;
                swordfishBoss.hurt = 1;
            }
        }
    if (swordfishBoss.active && torpedo.active && collision(sword.x, sword.y, sword.width, sword.height,
        torpedo.x, torpedo.y, torpedo.width, torpedo.height)) {
            swordfishHealth --;
            torpedo.active = 0;
        }
    if (swordfishHealth <= 0) {
        swordfishBoss.active = 0;
        sword.active = 0;
        goToWin();
    }
    // if (swordfishBoss.path <= 52 && swordfishBoss.direction == RIGHT) {
    //         swordfishBoss.x += 4;
    //         swordfishBoss.path += 1;
    //     } else if (swordfishBoss.path <= 52 && swordfishBoss.direction == LEFT) {
    //         swordfishBoss.x -= 4;
    //         swordfishBoss.path += 1;
    //     }
    //     if (swordfishBoss.path > 52 && swordfishBoss.direction == LEFT) {
    //         swordfishBoss.direction = RIGHT;
    //         swordfishBoss.path = 0;
    //     } else if (swordfishBoss.path > 52 && swordfishBoss.direction == RIGHT) {
    //         swordfishBoss.direction = LEFT;
    //         swordfishBoss.path = 0;
    //     }
    //     sword.direction = swordfishBoss.direction;
    //     if (sword.direction == LEFT) {
    //         sword.x = swordfishBoss.x - 16;
    //         sword.y = swordfishBoss.y + 16;
    //     } else {
    //         sword.x = swordfishBoss.width + swordfishBoss.x - 16;
    //         sword.y = swordfishBoss.y + 16;
    //     }
    // if (swordfishBoss.y < 350) {
    //     swordfishBoss.currStage = IDLE;
    // }
    if (swordfishBoss.currStage == IDLE) {
        if (swordfishBoss.direction == LEFT) {
            sword.x = swordfishBoss.x - 16;
        } else {
            sword.x = swordfishBoss.x + swordfishBoss.width - 16;
        }
        stageTimer = 0;
        if (swordfishBoss.y == player.y) { //&& abs(swordfishBoss.x - player.x) < CHASE_DISTANCE
            swordfishBoss.currStage = CHARGING;
        }
    } else if (swordfishBoss.currStage == CHARGING) {
        stageTimer++;
        swordfishBoss.timeUntilNextFrame--;
        if (swordfishBoss.timeUntilNextFrame == 0) {
            swordfishBoss.timeUntilNextFrame = 10;
            swordfishBoss.frame = (swordfishBoss.frame + 1) % swordfishBoss.numOfFrames;
        }
        if (swordfishBoss.y < player.y) {
            swordfishBoss.y++;
            sword.y++;
        } else {
            swordfishBoss.y--;
            sword.y--;
        if (swordfishBoss.direction == LEFT) {
            sword.x = swordfishBoss.x - 16;
        } else {
            sword.x = swordfishBoss.x + swordfishBoss.width - 16;
        }
        }
        if (stageTimer > CHASE_TIMER) {
            swordfishBoss.currStage = ATTACKING;
        }
    } else if (swordfishBoss.currStage == ATTACKING) {
        swordfishBoss.timeUntilNextFrame--;
        if (swordfishBoss.timeUntilNextFrame == 0) {
            swordfishBoss.timeUntilNextFrame = 5;
            swordfishBoss.frame = (swordfishBoss.frame + 1) % swordfishBoss.numOfFrames;
        }
        if (swordfishBoss.direction == RIGHT) {
            if (swordfishBoss.x <= 300) {
                swordfishBoss.x += 4;
                sword.x = swordfishBoss.x + swordfishBoss.width - 16;
                if (swordfishBoss.x > 300) {
                    stageTimer = 0;
                    swordfishBoss.currStage = CHARGING;
                    swordfishBoss.direction = LEFT;
                }
            }
        } else if (swordfishBoss.direction == LEFT) {
            if (swordfishBoss.x >= 110) {
                swordfishBoss.x -= 4;
                sword.x = swordfishBoss.x - 16;
                if (swordfishBoss.x < 110) {
                    stageTimer = 0;
                    swordfishBoss.currStage = CHARGING;
                    swordfishBoss.direction = RIGHT;
                }
            }
        }
    }
}

void drawSwordfish() {
    if (swordfishBoss.active) {
        if (swordfishBoss.y + swordfishBoss.height > vOff && swordfishBoss.y < SCREENHEIGHT + vOff) {
            shadowOAM[20].attr0 = ATTR0_Y(swordfishBoss.y - vOff) | ATTR0_4BPP | ATTR0_WIDE;
            shadowOAM[21].attr0 = ATTR0_Y(sword.y - vOff) | ATTR0_4BPP | ATTR0_WIDE;
        }
        if (swordfishBoss.direction == RIGHT) {
            shadowOAM[20].attr1 = ATTR1_X(swordfishBoss.x - hOff) | ATTR1_LARGE | ATTR1_HFLIP;
            shadowOAM[21].attr1 = ATTR1_X(sword.x - hOff) | ATTR1_TINY | ATTR1_HFLIP;
        } else {
            shadowOAM[20].attr1 = ATTR1_X(swordfishBoss.x -hOff) | ATTR1_LARGE;
            shadowOAM[21].attr1 = ATTR1_X(sword.x - hOff) | ATTR1_TINY;
        }
        if (swordfishBoss.hurt) {
            shadowOAM[20].attr2 = ATTR2_PALROW(1) | ATTR2_TILEID(7,swordfishBoss.frame * 4) | ATTR2_PRIORITY(0);
            shadowOAM[21].attr2 = ATTR2_PALROW(1) | ATTR2_TILEID(5,2) | ATTR2_PRIORITY(0);
        } else {
            shadowOAM[20].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(7,swordfishBoss.frame * 4) | ATTR2_PRIORITY(0);
            shadowOAM[21].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(5,2) | ATTR2_PRIORITY(0);
        }
    } else {
        shadowOAM[20].attr0 = ATTR0_HIDE;
        shadowOAM[21].attr0 = ATTR0_HIDE;
    }
}

void initTorpedo() {
    torpedo.dx = 5;
    torpedo.width = 6;
    torpedo.height = 6;
    torpedo.active = 0;
}

void spawnTorpedo() {
    if (cheatEnabled) {
        torpedo.dx = 8;
        torpedo.width = 32;
        torpedo.height = 16;
    }
    if (!torpedo.active) {
        torpedo.active = 1;
        torpedo.x = player.x;
        torpedo.y = player.y - 8;
        if (player.direction == LEFT) {
            torpedoFacing = -1;
            torpedo.x = player.x - torpedo.width;
        } else {
            torpedoFacing = 1;
            torpedo.x = player.x + torpedo.width;
        }
    }
}

void updateTorpedo() {
    if (BUTTON_PRESSED(BUTTON_A) && !torpedo.active) {
        spawnTorpedo();
        playSoundB(shot_data, shot_length - 100, 0);
    }
    if (torpedo.active) {
        torpedo.x += torpedoFacing * TORPEDO_SPEED;
        if (torpedo.x + torpedo.width < 0 || torpedo.x > MAPWIDTH ||
            abs(torpedo.x - player.x) > SCREENWIDTH / 2) {
                torpedo.active = 0;
            }
    }
}

void drawTorpedo() {
    if (torpedo.active) {
        if (!cheatEnabled) {
            shadowOAM[1].attr0 = ATTR0_Y(torpedo.y - vOff) | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[1].attr1 = ATTR1_X(torpedo.x - hOff) | ATTR1_TINY;
            shadowOAM[1].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 8);
        } else {
            shadowOAM[1].attr0 = ATTR0_Y(torpedo.y - vOff) | ATTR0_4BPP | ATTR0_WIDE;
            if (torpedoFacing == -1) {
                shadowOAM[1].attr1 = ATTR1_X(torpedo.x - hOff) | ATTR1_MEDIUM | ATTR1_HFLIP;
            } else {
                shadowOAM[1].attr1 = ATTR1_X(torpedo.x - hOff) | ATTR1_MEDIUM;
            }
            shadowOAM[1].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 9);
        }
    } else {
        shadowOAM[1].attr0 = ATTR0_HIDE;
    }
}

void initShark() {
    for (int i = 0; i < MAX_SHARKS; i++) {
        sharks[i].health = SHARK_MAX_HEALTH;
        sharks[i].width = 64;
        sharks[i].height = 32;
        //sharks[i].x = 90 * i + 50;
        //sharks[i].y = 350;
        sharks[i].active = 1;
        sharks[i].direction = LEFT;
        sharks[i].path = 0;
        sharks[i].timeUntilNextFrame = 10;
        sharks[i].numOfFrames = 3;
        sharks[i].frame = 0;
        if (i == 0) {
            sharks[i].x = 270;
            sharks[i].y = 50;
        } else if (i == 1) {
            sharks[i].x = 90;
            sharks[i].y = 80;
        } else {
            sharks[i].x = 350;
            sharks[i].y = 260;
        }
    }
}

void updateShark() {
    for (int i = 0; i < MAX_SHARKS; i++) {
        if (sharks[i].hurt) sharks[i].hurt = 0;
        if (sharks[i].active && collision(player.x, player.y, player.width, player.height,
            sharks[i].x, sharks[i].y, sharks[i].width, sharks[i].height)) {
                goToLose();
            }
        if (sharks[i].active && torpedo.active && collision(torpedo.x, torpedo.y, torpedo.width, torpedo.height,
            sharks[i].x, sharks[i].y, sharks[i].width, sharks[i].height)) {
                torpedo.active = 0;
                if (cheatEnabled) {
                    sharks[i].health = 0;
                } else {
                    sharks[i].health -= 1;
                    sharks[i].hurt = 1;

                }
        }
        if (sharks[i].health <= 0) {
            sharks[i].active = 0;
        }
        if (sharks[i].path <= 50 && sharks[i].direction == RIGHT) {
            sharks[i].x += 2;
            sharks[i].path += 1;
            sharks[i].timeUntilNextFrame--;
            if (sharks[i].timeUntilNextFrame == 0) {
                sharks[i].timeUntilNextFrame = 10;
                sharks[i].frame = (sharks[i].frame + 1) % sharks[i].numOfFrames;
            }
        } else if (sharks[i].path <= 50 && sharks[i].direction == LEFT) {
            sharks[i].x -= 2;
            sharks[i].path += 1;
            sharks[i].timeUntilNextFrame--;
            if (sharks[i].timeUntilNextFrame == 0) {
                sharks[i].timeUntilNextFrame = 10;
                sharks[i].frame = (sharks[i].frame + 1) % sharks[i].numOfFrames;
            }
        }
        if (sharks[i].path > 50 && sharks[i].direction == LEFT) {
            sharks[i].direction = RIGHT;
            sharks[i].path = 0;
            sharks[i].frame = 0;
            sharks[i].timeUntilNextFrame = 10;
        } else if (sharks[i].path > 50 && sharks[i].direction == RIGHT) {
            sharks[i].direction = LEFT;
            sharks[i].path = 0;
            sharks[i].frame = 0;
            sharks[i].timeUntilNextFrame = 10;
        }
    }
}

void drawShark() {
    shadowOAMIndex = 2;
    for (int i = 0; i < MAX_SHARKS; i ++) {
        if (sharks[i].active == 1) {
            if (sharks[i].y + sharks[i].height > vOff && sharks[i].y < SCREENHEIGHT + vOff) {
                shadowOAM[shadowOAMIndex + i].attr0 = ATTR0_Y(sharks[i].y - vOff) | ATTR0_4BPP | ATTR0_WIDE;
                shadowOAM[shadowOAMIndex + i].attr1 = ATTR1_X(sharks[i].x - hOff) | ATTR1_LARGE;
                if (sharks[i].direction == RIGHT) {
                    shadowOAM[shadowOAMIndex + i].attr1 = shadowOAM[shadowOAMIndex + i].attr1 = ATTR1_X(sharks[i].x - hOff) | ATTR1_LARGE | ATTR1_HFLIP;
                }
                if (sharks[i].hurt) {
                    shadowOAM[shadowOAMIndex + i].attr2 = ATTR2_PALROW(1) | ATTR2_TILEID(15, sharks[i].frame * 4);
                } else {
                    shadowOAM[shadowOAMIndex + i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(15, sharks[i].frame * 4);   
                }
            } 
        } else {
            shadowOAM[shadowOAMIndex + i].attr0 = ATTR0_HIDE;
        }
    }
}