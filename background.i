# 1 "background.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "background.c"
# 1 "background.h" 1
       
# 1 "game.h" 1
       
extern int score;
int wait;
int maxWait;


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






extern PLAYER cannon;
extern FISHIE fishies[8];
extern int fishiesRemaining;


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
# 3 "background.h" 2

void drawBackground();
void drawWave(int col, int row);
void resetBackground(int col, int row);
# 2 "background.c" 2
# 1 "colors.h" 1
# 3 "background.c" 2
# 1 "HW3Lib.h" 1




typedef unsigned short u16;
# 25 "HW3Lib.h"
extern volatile unsigned short *videoBuffer;
# 42 "HW3Lib.h"
void setPixel(int col, int row, unsigned short color);
void drawRect(int col, int row, int width, int height, unsigned short color);
void fillScreen(unsigned short color);


void waitForVBlank();
# 67 "HW3Lib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 77 "HW3Lib.h"
int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
# 4 "background.c" 2


int wave[10][15] =
{
    { 0, 0, 0, 0, 0x7292, 0x7292, 0x7292, 0x7292, 0x7292, 0x7292, 0x7292, 0, 0, 0, 0},
    { 0, 0, 0, 0x7292, 0x7292, 0x7292, 0x7292, 0x7292, 0x7292, 0x7292, 0x7292, 0x7292, 0, 0, 0},
    { 0, 0, 0x7292, 0x7292, 0x7292, 0x7292, 0x7292, 0x7292, 0x7292, 0x7292, 0x7292, 0x7292, 0x7292, 0, 0},
    { 0, 0, 0x7292, 0x7292, 0x7292, 0x7292, 0x7292, 0x7292, 0x7292, 0x7292, 0x7292, 0x7292, 0x7292, 0, 0},
    { 0, 0x7292, 0x7292, 0x7292, 0x7292, 0x7292, 0x7292, 0x7292, 0x7292, 0x7292, 0x7292, 0x7292, 0x7292, 0x7292, 0},
    {0x7292, 0x7292, 0x7292, 0x7292, 0x7292, 0x7292, 0x7292, 0x7292, 0x7292, 0x7292, 0x7292, 0x7292, 0x7292, 0x7292, 0x7292},
    {0x7292, 0x7292, 0x7292, 0x7292, 0x7292, 0x7292, 0x7292, 0, 0x7292, 0x7292, 0x7292, 0x7292, 0x7292, 0x7292, 0x7292},
    {0x7292, 0x7292, 0x7292, 0x7292, 0x7292, 0x7292, 0, 0, 0, 0x7292, 0x7292, 0x7292, 0x7292, 0x7292, 0x7292},
    {0x7292, 0x7292, 0x7292, 0x7292, 0x7292, 0, 0, 0, 0, 0, 0x7292, 0x7292, 0x7292, 0x7292, 0x7292},
    {0x7292, 0x7292, 0x7292, 0x7292, 0, 0, 0, 0, 0, 0, 0, 0x7292, 0x7292, 0x7292, 0x7292}
};

void drawBackground() {
    int i = 0;
    while (i < 4320) {
        videoBuffer[i++] = 0x7FDB;
    }
    while (i < 240 * 160) {
        videoBuffer[i++] = 0x7352;
    }
    int col = 0;
    while (col < 240) {
        drawWave(col, 13);
        col += 15;
    }
}

void drawWave(int col, int row) {
    int waveCol = 0;
    int waveRow = 0;
    for (int i = col; i < col + 15; i++) {
        for (int j = row; j < row + 10; j++) {
            if (i < 240 && wave[waveRow++][waveCol] == 0x7292) {
                setPixel(i, j, 0x7292);
            }
        }
        waveRow = 0;
        waveCol += 1;
    }
}

void resetBackground(int col, int row) {
    int currRow = 0;
    int waveRow = 0;
    int waveCol = (col % 15);
    while (currRow < row) {
        u16 color = 0;
        if (currRow < 13) {
            color = 0x7FDB;
        } else if (currRow < 18) {
            color = (wave[waveRow++][waveCol] == 0) ? 0x7FDB : 0x7292;
        } else if (currRow < 23) {
            color = (wave[waveRow++][waveCol] == 0) ? 0x7352 : 0x7292;
        } else {
            color = 0x7352;
        }
        setPixel(col, currRow++, color);
    }
}
