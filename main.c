/* Additional Comments
Music added, map with collision added
Need better collision detection, need to add collision with torpedo for map
Struggling witih adding second background (palette gets screwed up)
Need animations
*/

#include <stdio.h>
#include <stdlib.h>
#include "gba.h"
#include "mode0.h"
#include "game.h"
#include "print.h"
#include "sprites.h"
#include "subSprites.h"
#include "start.h"
#include "instructions.h"
#include "bg.h"
#include "pause.h"
#include "win.h"
#include "lose.h"
#include "reef.h"
#include "waterBackground.h"
#include "sound.h"
#include "waterMusic.h"

#define MAPWIDTH 512
#define MAPHEIGHT 512

// Prototypes
void initialize();

// State Prototypes
void goToStart();
void start();
void goToInstructions();
void instructions();
void goToGame();
void game();
void goToPause();
void pause();
void goToWin();
void win();
void goToLose();
void lose();

// States
enum {
    START,
    INSTRUCTIONS,
    GAME,
    PAUSE,
    WIN,
    LOSE
};
int state;

OBJ_ATTR shadowOAM[128];

unsigned short oldButtons;
unsigned short buttons;

int main() {
    initialize();

    while (1) {
        oldButtons = buttons;
        buttons = REG_BUTTONS;

        // State Machine
        switch (state)
            {
            case START:
                start();
                break;
            case INSTRUCTIONS:
                instructions();
                break;
            case GAME:
                game();
                break;
            case PAUSE:
                pause();
                break;
            case WIN:
                win();
                break;
            case LOSE:
                lose();
                break;
            }

        waitForVBlank();
        DMANow(3, shadowOAM, OAM, 128*4);
    }
}


void initialize() {
    hideSprites();
    DMANow(3, shadowOAM, OAM, 512);
    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | SPRITE_ENABLE;
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(31) | BG_SIZE_SMALL | BG_4BPP;

    buttons = REG_BUTTONS;
    oldButtons = 0;
    //Spritesheets
    DMANow(3, subSpritesPal, SPRITEPALETTE, subSpritesPalLen / 2);
    DMANow(3, subSpritesTiles, &CHARBLOCK[4], subSpritesTilesLen / 2);
    setupSounds();
    setupInterrupts();
    goToStart(); 
}

// Sets up start stateB
void goToStart() {
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;
    REG_DISPCTL = MODE(0) | BG_ENABLE(0);
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(31) | BG_SIZE_SMALL | BG_4BPP;
    state = START;
    playSoundA(waterMusic_data, waterMusic_length, 1);
    DMANow(3, startPal, PALETTE, startPalLen / 2);
    DMANow(3, startTiles, &CHARBLOCK[0], startTilesLen / 2);
    DMANow(3, startMap, &SCREENBLOCK[31], startMapLen / 2);
}

// Runs every frame of the start state
void start() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToInstructions();
    }
}

// Sets up the instruction state
void goToInstructions() {
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;
    REG_DISPCTL = MODE(0) | BG_ENABLE(0);
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(31) | BG_4BPP | BG_SIZE_SMALL;

    state = INSTRUCTIONS;
    DMANow(3, instructionsPal, PALETTE, instructionsPalLen / 2);
    DMANow(3, instructionsTiles, &CHARBLOCK[0], instructionsTilesLen / 2);
    DMANow(3, instructionsMap, &SCREENBLOCK[31], instructionsMapLen / 2);
}

// Runs every frame of the insctruction state
void instructions() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        initGame();
        goToGame();
    }
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }
}

// Sets up game state
void goToGame() {
    hideSprites();
    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | BG_ENABLE(1) | SPRITE_ENABLE; // Enable sprites
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_4BPP | BG_SIZE_LARGE;
    REG_BG1CNT = BG_CHARBLOCK(2) | BG_SCREENBLOCK(24) | BG_4BPP | BG_SIZE_SMALL;
    state = GAME;
    DMANow(3, reefPal, PALETTE, reefPalLen / 2); 
    DMANow(3, reefTiles, &CHARBLOCK[0], reefTilesLen / 2);
    DMANow(3, reefMap, &SCREENBLOCK[28], reefMapLen / 2);
    //DMANow(3, waterBackgroundPal, PALETTE, waterBackgroundPalLen / 2); 
    DMANow(3, waterBackgroundTiles, &CHARBLOCK[2], waterBackgroundTilesLen / 2);
    DMANow(3, waterBackgroundMap, &SCREENBLOCK[24], waterBackgroundMapLen / 2);
}

// Runs every frame of the game state
void game() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }
    updateGame();
    waitForVBlank();
    drawGame();
}

// Sets up pause state
void goToPause() {
    REG_BG2HOFF = 0;
    REG_BG2VOFF = 0;
    REG_DISPCTL = MODE(0) | BG_ENABLE(2);
    REG_BG2CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(20) | BG_4BPP | BG_SIZE_SMALL;
    
    state = PAUSE;

    pauseSound();
    DMANow(3, pausePal, PALETTE, pausePalLen / 2);
    DMANow(3, pauseTiles, &CHARBLOCK[1], pauseTilesLen / 2);
    DMANow(3, pauseMap, &SCREENBLOCK[20], pauseMapLen / 2);

}

// Runs every frame of the pause state
void pause() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        unpauseSound();
        goToGame();
    }
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }
}

// Sets up win state
void goToWin() {
    REG_BG2HOFF = 0;
    REG_BG2VOFF = 0;
    REG_DISPCTL = MODE(0) | BG_ENABLE(2);
    REG_BG2CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(20) | BG_4BPP | BG_SIZE_SMALL;

    state = WIN;
    DMANow(3, winPal, PALETTE, winPalLen / 2);
    DMANow(3, winTiles, &CHARBLOCK[1], winTilesLen / 2);
    DMANow(3, winMap, &SCREENBLOCK[20], winMapLen / 2);
}

// Runs every frame of the win state
void win() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}

// Sets up lose state
void goToLose() {
    REG_BG2HOFF = 0;
    REG_BG2VOFF = 0;
    REG_DISPCTL = MODE(0) | BG_ENABLE(2);
    REG_BG2CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(20) | BG_4BPP | BG_SIZE_SMALL;
    
    state = LOSE;
    DMANow(3, losePal, PALETTE, losePalLen / 2);
    DMANow(3, loseTiles, &CHARBLOCK[1], loseTilesLen / 2);
    DMANow(3, loseMap, &SCREENBLOCK[20], loseMapLen / 2);
}

// Runs every frame of the lose state
void lose() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}


