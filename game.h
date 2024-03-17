// Constants
#define MAPWIDTH 512
#define MAPHEIGHT 512

// Prototypes
void initGame();
void updateGame();
void drawGame();

// typedef struct {
//     int screenRow;
//     int screenCol;
//     int worldRow;
//     int worldCol;
//     int width;
//     int height;
//     int facingDirection;
//     int health;
// } Player;

// Player Prototypes
void initPlayer();
void updatePlayer();
void drawPlayer();

typedef struct {
    int x;
    int y;
    int dx;
    int dy;
    int width;
    int height;
    int direction;
    int isMoving;
    int timeUntilNextFrame;
    int frame;
    int numOfFrames;
    int active;
    int hide;
    int path;
    int hurt;
    enum {
        IDLE,
        CHARGING,
        ATTACKING
    } currStage;
} SwordfishBoss;
#define CHASE_DISTANCE 220
#define CHASE_TIMER 10 
// Swordfish Prototypes
void initSwordfish();
void updateSwordfish();
void drawSwordfish();


typedef struct {
    int x;
    int y;
    int dx;
    int dy;
    int width;
    int height;
    int direction;
    int isMoving;
    int timeUntilNextFrame;
    int frame;
    int numOfFrames;
    int active;
    int hide;
    int health;
    int path;
    int hurt;
} Shark;
// Shark Prototypes
void initShark();
void updateShark();
void drawShark();
#define MAX_SHARKS 3
#define SHARK_MAX_HEALTH 3
#define SHARK_SPEED 4


typedef struct {
    int screenRow;
    int screenCol;
    int worldRow;
    int worldCol;
    int width;
    int height;
    int colVelocity;
    int direction;
    int hide;
} Torpedo;
#define TORPEDO_SPEED 5

// Torpedo Prototypes
void initTorpedo();
void spawnTorpedo();
void updateTorpedo();
void drawTorpedo();

typedef struct {
    int x;
    int y;
    int width;
    int height;
    int timeUntilNextFrame;
    int frame;
    int numOfFrames;
} Jellyfish;
#define JELLY_COUNT 3
// Jellyfish prototypes
void initJellyfish();
void updateJellyfish();
void drawJellyfish();

