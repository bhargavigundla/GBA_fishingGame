#include <stdlib.h>
#include "colors.h"
#include "HW3Lib.h"
#include "game.h"
#include "background.h"

// Variables
PLAYER hook;
FISHIE fishies[FISHIECOUNT];
int fishiesRemaining;
int wait;
int maxWait = 2;
int score;

u16 hookMap[5][5] = {
	{BLACK, BLACK, HOOK, BLACK, BLACK},
	{HOOK, BLACK, HOOK, BLACK, HOOK},
	{HOOK, BLACK, HOOK, BLACK, HOOK},
	{HOOK, BLACK, HOOK, BLACK, HOOK},
	{HOOK, HOOK, HOOK, HOOK, HOOK}
}; 

// Initialize the game
void initGame() {

	initHook();

	initFishies();
	fishiesRemaining = FISHIECOUNT;
}

// Updates the game each frame
int updateGame() {
	wait += (wait == maxWait) ? -maxWait : 1;
	updateHook();

	int gameOver = 0;
	// Update all the fishies
	for (int i = 0; i < FISHIECOUNT; i++) {
		gameOver = (gameOver == 1) ? 1 : updateFish(&fishies[i]);
	}
	return gameOver;
}

// Draws the game each frame
void drawGame() {

	drawHook();

	// Draw all the fishies
	for (int i = 0; i < FISHIECOUNT; i++) {
		drawFish(&fishies[i]);
	}
}

// Initialize the hook
void initHook() {
 	hook.row = 23;
 	hook.col = 118;
 	hook.oldRow = hook.row;
 	hook.oldCol = hook.col;
 	hook.cdel = 1;
	hook.rdel = 1;
 	hook.height = 5;
 	hook.width = 5;
 	hook.color = HOOK;
 	hook.bulletTimer = 20;
}

// Handle every-frame actions of the hook
void updateHook() {

 	// // Move the hook
 	if (BUTTON_HELD(BUTTON_LEFT)) {
 		hook.col -= (hook.col >= hook.cdel) ? hook.cdel : 0;
 	} else if (BUTTON_HELD(BUTTON_RIGHT)) {
 		hook.col += (hook.col + hook.width - 1 < SCREENWIDTH - hook.cdel) ? hook.cdel : 0;
	} else if (BUTTON_HELD(BUTTON_UP)) {
		hook.row -= (hook.row >= hook.rdel && hook.row > 23) ? hook.rdel : 0; 
	} else if (BUTTON_HELD(BUTTON_DOWN)) {
		hook.row += (hook.row + hook.height - 1 < SCREENHEIGHT - hook.rdel) ? hook.rdel : 0;
	}
}

// Draw the hook
void drawHook() {
 	drawRect(hook.oldCol, hook.oldRow, hook.width, hook.height, SEA);
    int hCol = 0;
    int hRow = 0;
    for (int i = hook.col; i < hook.col + 5; i++) {
        for (int j = hook.row; j < hook.row + 5; j++) {
			setPixel(i, j, hookMap[hRow++][hCol]);
        }
        hRow = 0;
        hCol += 1;
    } 
	drawFishingLine();
 	hook.oldRow = hook.row;
	hook.oldCol = hook.col;
}

// Initialize the fishies
void initFishies() {
 	for (int i = 0; i < FISHIECOUNT; i++) {
 		fishies[i].height = 8;
 		fishies[i].width = 8;
 		fishies[i].row = rand() % (110 - 23) + 23;
 		fishies[i].col = rand() % 160;
 		fishies[i].oldRow = fishies[i].row;
 		fishies[i].oldCol = fishies[i].col;
 		fishies[i].rdel = (i % 2 == 0) ? 1 : -1;
 		fishies[i].cdel = 1;
 		fishies[i].color = COLOR(rand() % 30, rand() % 31, rand() % 31);
 		fishies[i].active = 1;
 		fishies[i].erased = 0;
		fishies[i].evil = (i % 2 == 0) ? 0 : 1;
 	}
}

// Handle every-frame actions of a fish
int updateFish(FISHIE* b) {

	if (b->active) {
		// Move the fish
		if (wait == maxWait) {
			// Bounce the fish off the sides of the box
			if (b->row <= 23 || b->row + b->height-1 > 159)
				b->rdel *= -1;
			if (b->col <= 0 || b->col + b->width-1 >= SCREENWIDTH-1)
				b->cdel *= -1;
			b->row += b->rdel;
			b->col += b->cdel;
		}

		// collision detection
		if (collision(b->col, b->row, b->width, b->height, 
		    hook.col, hook.row, hook.width, hook.height)) {
			REG_SND2CNT = DMG_ENV_VOL(15) | DMG_DIRECTION_DECR | DMG_STEP_TIME(7) | DMG_DUTY_50;
    		REG_SND2FREQ = NOTE_A7 | SND_RESET | DMG_FREQ_TIMED;
			if (b->evil) {
				return 1; // return game is over
			} else {
				b->color = COLOR(rand() % 30, rand() % 31, rand() % 31);
				score += 1;
				b->row = rand() % (110 - 23) + 23;
				b->col = rand() % 160;
				return 0;
			}
		}
	}
	return 0;
}

// Draw a fish
void drawFish(FISHIE* b) {
	if (wait == maxWait) {
			drawRect(b->oldCol, b->oldRow, b->width, b->height, SEA);
			drawRect(b->col, b->row, b->width, b->height, b->color);
		if (b-> evil) {
			drawRect(b->col + (b->width / 4), b->row + (b->height / 4),  (b->width / 2), (b->height / 2), ~b->color);
		}
		b->oldRow = b->row;
		b->oldCol = b->col;
	}
}

void swapDifficulty() {
	maxWait = (maxWait == 0) ? 2 : 0;
	wait = 0;
}

void enableEasyMode() {
	maxWait = 2;
}

void enableHardMode() {
	maxWait = 0;
}

void drawFishingLine() {
	int col = hook.col + 2;
	int row = hook.row - 1;
	resetBackground(hook.oldCol + 2, hook.oldRow);
	while (row >= 0) {
		setPixel(col, row--, LINE);
	}
}