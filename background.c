#include "background.h"
#include "colors.h"    
#include "HW3Lib.h"    
#include "game.h"      

int wave[10][15] =          
{
    {  BLACK,   BLACK,   BLACK,   BLACK, SEAFOAM, SEAFOAM, SEAFOAM, SEAFOAM, SEAFOAM, SEAFOAM, SEAFOAM,   BLACK,   BLACK,   BLACK,   BLACK},
    {  BLACK,   BLACK,   BLACK, SEAFOAM, SEAFOAM, SEAFOAM, SEAFOAM, SEAFOAM, SEAFOAM, SEAFOAM, SEAFOAM, SEAFOAM,   BLACK,   BLACK,   BLACK},
    {  BLACK,   BLACK, SEAFOAM, SEAFOAM, SEAFOAM, SEAFOAM, SEAFOAM, SEAFOAM, SEAFOAM, SEAFOAM, SEAFOAM, SEAFOAM, SEAFOAM,   BLACK,   BLACK},
    {  BLACK,   BLACK, SEAFOAM, SEAFOAM, SEAFOAM, SEAFOAM, SEAFOAM, SEAFOAM, SEAFOAM, SEAFOAM, SEAFOAM, SEAFOAM, SEAFOAM,   BLACK,   BLACK},
    {  BLACK, SEAFOAM, SEAFOAM, SEAFOAM, SEAFOAM, SEAFOAM, SEAFOAM, SEAFOAM, SEAFOAM, SEAFOAM, SEAFOAM, SEAFOAM, SEAFOAM, SEAFOAM,   BLACK}, 
    {SEAFOAM, SEAFOAM, SEAFOAM, SEAFOAM, SEAFOAM, SEAFOAM, SEAFOAM, SEAFOAM, SEAFOAM, SEAFOAM, SEAFOAM, SEAFOAM, SEAFOAM, SEAFOAM, SEAFOAM}, 
    {SEAFOAM, SEAFOAM, SEAFOAM, SEAFOAM, SEAFOAM, SEAFOAM, SEAFOAM,   BLACK, SEAFOAM, SEAFOAM, SEAFOAM, SEAFOAM, SEAFOAM, SEAFOAM, SEAFOAM},
    {SEAFOAM, SEAFOAM, SEAFOAM, SEAFOAM, SEAFOAM, SEAFOAM,   BLACK,   BLACK,   BLACK, SEAFOAM, SEAFOAM, SEAFOAM, SEAFOAM, SEAFOAM, SEAFOAM}, 
    {SEAFOAM, SEAFOAM, SEAFOAM, SEAFOAM, SEAFOAM,   BLACK,   BLACK,   BLACK,   BLACK,   BLACK, SEAFOAM, SEAFOAM, SEAFOAM, SEAFOAM, SEAFOAM}, 
    {SEAFOAM, SEAFOAM, SEAFOAM, SEAFOAM,   BLACK,   BLACK,   BLACK,   BLACK,   BLACK,   BLACK,   BLACK, SEAFOAM, SEAFOAM, SEAFOAM, SEAFOAM}
};

void drawBackground() {
    int i = 0;
    while (i < 4320) {
        videoBuffer[i++] = SKY;
    }
    while (i < SCREENWIDTH * SCREENHEIGHT) {
        videoBuffer[i++] = SEA;
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
            if (i < 240 && wave[waveRow++][waveCol] == SEAFOAM) {
                setPixel(i, j, SEAFOAM);   
            }
        }
        waveRow = 0;
        waveCol += 1;
    }
}

void resetBackground(int col, int row) {
    int currRow = 0;                      
    int waveRow = 0;                 // the row coordinate of the wave bitmap            
    int waveCol = (col % 15);  // the col coordinate of the wave bitmap
    while (currRow < row) {                 
        u16 color = BLACK;                          
        if (currRow < 13) {                        
            color = SKY;                            
        } else if (currRow < 18) {             
            color = (wave[waveRow++][waveCol] == BLACK) ? SKY : SEAFOAM; 
        } else if (currRow < 23) {
            color = (wave[waveRow++][waveCol] == BLACK) ? SEA : SEAFOAM; 
        } else {
            color = SEA;
        }
        setPixel(col, currRow++, color);
    }
}