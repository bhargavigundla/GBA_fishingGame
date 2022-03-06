#include <stdlib.h>
#include "HW3Lib.h"
#include "game.h"
#include "text.h"
#include "print.h"
#include "colors.h"
#include "background.h"

// Prototypes
void initialize();

// State Prototypes
void goToStart();
void goToGame();
void goToPause();
void goToWin();
void goToLose();

void start();
void game();
void pause();
void win();
void lose();

void drawStartString();
void drawPauseString();
void drawWinString();
void drawLoseString();

int calculateCenter(int numChars);
void printScore();

// States
enum {START, GAME, PAUSE, WIN, LOSE};
int state;

// Button Variables
unsigned short buttons;
unsigned short oldButtons;

// Random Seed
int seed;

int main() {
    mgba_open();
    mgba_printf("Debugging Initialized");

    initialize();

    while(1) {

        // Update button variables
        oldButtons = buttons;
        buttons = BUTTONS;
                
        // State Machine
        switch(state) {
            case (START):
                start();            
                break;
            case(GAME):
                game();                                        
                break;
            case(PAUSE):
                pause();                
                break;
            case(WIN):
                win();
                break;
            case(LOSE):
                lose();
                break;
        }
    }
}

// Sets up GBA
void initialize() {

    REG_DISPCTL = MODE3 | BG2_ENABLE;

    // Sound Setup
    REG_SOUNDCNT_X = SND_ENABLED; // Enable sound

    REG_SOUNDCNT_L = DMG_VOL_LEFT(5) |
                   DMG_VOL_RIGHT(5) |
                   DMG_SND1_LEFT |
                   DMG_SND1_RIGHT |
                   DMG_SND2_LEFT |
                   DMG_SND2_RIGHT |
                   DMG_SND3_LEFT |
                   DMG_SND3_RIGHT |
                   DMG_SND4_LEFT |
                   DMG_SND4_RIGHT;

    REG_SOUNDCNT_H = DMG_MASTER_VOL(2);
    
    goToStart();
}

void goToStart() {
    state = START;
    score = 0;
    waitForVBlank();
    drawBackground();
    drawStartString();
}

void goToGame() {
    state = GAME;
    waitForVBlank();
    drawBackground();
}

void goToPause() {
    state = PAUSE;
    waitForVBlank();
    drawBackground();
    drawPauseString();
}

void goToWin() {
    state = WIN;
    waitForVBlank();
    drawBackground();
    drawWinString();
}

void goToLose() {
    state = LOSE;
    waitForVBlank();
    drawBackground();
    drawLoseString();
}

void start() {
    seed += 1;
    if(BUTTON_PRESSED(BUTTON_START)) {
        srand(seed);
        goToGame();
        initGame();
    }
}

void game() {    
    if (updateGame() == 1) {
        waitForVBlank();
        if (score == 999) {
            goToWin();
        } else {
            goToLose();
        }
    } else {
        waitForVBlank();
        drawGame();
        printScore();
    }
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToPause();
    } 
    if (BUTTON_PRESSED(BUTTON_A)) {
        swapDifficulty();
    }
}

void pause() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
    }  
}

void win() {
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }
}

void lose() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}

// drawString calls for each state transition function inside the state machine   
void drawStartString() {
    drawString(calculateCenter(19), 70, "press START to play", WHITE);
}

void drawPauseString() {
    drawString(calculateCenter(29), 70, "paused, press start to resume", WHITE);
    printScore();  
}

void drawWinString() {
    drawString(calculateCenter(8), 70, "you win!", WHITE);
    printScore();
}

void drawLoseString() {
    drawString(calculateCenter(9), 60, "game over", WHITE);
    drawString(calculateCenter(29), 70, "press start to return to menu", WHITE);
    printScore();
}

int calculateCenter(int numChars) {
    return ((240 - (numChars * 6)) / 2);
}

void printScore() {
    char scoreStr[] = {'S', 'C', 'O', 'R', 'E', ':', (score / 100) + '0', ((score / 10) % 10) + '0', (score % 10) + '0','\0'};
    drawStringWithBackground(calculateCenter(9), 3, scoreStr, SEAFOAM, SKY);
}