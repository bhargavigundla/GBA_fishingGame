#pragma once
extern int score;
int wait;
int maxWait;

// Player/Hook Struct
typedef struct {
	int row;
	int col;
	int oldRow;
	int oldCol;
	int cdel;
	int rdel;
	int height;
	int width;
	unsigned short color;
	int bulletTimer;
} PLAYER;

// Fishie Struct
typedef struct {
	int row;
	int col;
	int oldRow;
	int oldCol;
	int rdel;
	int cdel;
	int height;
	int width;
	unsigned short color;
	int active;
	int erased;
	int evil;
} FISHIE;

// Constants
#define FISHIECOUNT 8

// Variables
// UNCOMMENT 3.0
extern PLAYER cannon;
extern FISHIE fishies[FISHIECOUNT];
extern int fishiesRemaining;

// Prototypes
void initGame();
int updateGame();
void updateScore();
void drawGame();
void initHook();
void updateHook();
void drawHook(); 
void initBullets();
void fireBullet();
void initFishies();
int updateFish(FISHIE *);
void drawFish(FISHIE *);
void swapDifficulty();
void enableEasyMode();
void enableHardMode();
void drawFishingLine();