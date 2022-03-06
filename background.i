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
# 100 "HW3Lib.h"
enum {
  REST = 0,
  NOTE_C2 =44,
  NOTE_CS2 =157,
  NOTE_D2 =263,
  NOTE_DS2 =363,
  NOTE_E2 =457,
  NOTE_F2 =547,
  NOTE_FS2 =631,
  NOTE_G2 =711,
  NOTE_GS2 =786,
  NOTE_A2 =856,
  NOTE_AS2 =923,
  NOTE_B2 =986,
  NOTE_C3 =1046,
  NOTE_CS3 =1102,
  NOTE_D3 =1155,
  NOTE_DS3 =1205,
  NOTE_E3 =1253,
  NOTE_F3 =1297,
  NOTE_FS3 =1339,
  NOTE_G3 =1379,
  NOTE_GS3 =1417,
  NOTE_A3 =1452,
  NOTE_AS3 =1486,
  NOTE_B3 =1517,
  NOTE_C4 =1547,
  NOTE_CS4 =1575,
  NOTE_D4 =1602,
  NOTE_DS4 =1627,
  NOTE_E4 =1650,
  NOTE_F4 =1673,
  NOTE_FS4 =1694,
  NOTE_G4 =1714,
  NOTE_GS4 =1732,
  NOTE_A4 =1750,
  NOTE_AS4 =1767,
  NOTE_B4 =1783,
  NOTE_C5 =1798,
  NOTE_CS5 =1812,
  NOTE_D5 =1825,
  NOTE_DS5 =1837,
  NOTE_E5 =1849,
  NOTE_F5 =1860,
  NOTE_FS5 =1871,
  NOTE_G5 =1881,
  NOTE_GS5 =1890,
  NOTE_A5 =1899,
  NOTE_AS5 =1907,
  NOTE_B5 =1915,
  NOTE_C6 =1923,
  NOTE_CS6 =1930,
  NOTE_D6 =1936,
  NOTE_DS6 =1943,
  NOTE_E6 =1949,
  NOTE_F6 =1954,
  NOTE_FS6 =1959,
  NOTE_G6 =1964,
  NOTE_GS6 =1969,
  NOTE_A6 =1974,
  NOTE_AS6 =1978,
  NOTE_B6 =1982,
  NOTE_C7 =1985,
  NOTE_CS7 =1989,
  NOTE_D7 =1992,
  NOTE_DS7 =1995,
  NOTE_E7 =1998,
  NOTE_F7 =2001,
  NOTE_FS7 =2004,
  NOTE_G7 =2006,
  NOTE_GS7 =2009,
  NOTE_A7 =2011,
  NOTE_AS7 =2013,
  NOTE_B7 =2015,
  NOTE_C8 =2017
} NOTES;


extern volatile unsigned short *videoBuffer;
# 195 "HW3Lib.h"
void setPixel(int col, int row, unsigned short color);
void drawRect(int col, int row, int width, int height, unsigned short color);
void fillScreen(unsigned short color);


void waitForVBlank();
# 220 "HW3Lib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 230 "HW3Lib.h"
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
