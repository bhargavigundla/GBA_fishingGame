#include "HW3Lib.h"
#include "text.h"
#include "font.h"

// Draws the specified character at the specified location in Mode 3
void drawChar(int col, int row, char ch, unsigned short color) {
    for (int i = 0; i < 8; i++) {
        for (int j = 0; j < 6; j++) {
            if (fontdata_6x8[48 * ch + j + 6*i]) {
                setPixel(col + j, row + i, color);
            } // if
        } // for
    } // for
}

// Draws the specified string at the specified location in Mode 3
void drawString(int col, int row, char *str, unsigned short color) {
    int currCol = col;
    char *ptr = str;
    while (*ptr != '\0') { // while the pointer is not pointing to null character
        drawChar(currCol, row, *ptr, color);     // draw char at current col
        currCol += 6;                            // increment col to next print location
        ptr += 1;                                // increment pointer to next memory location
    }
}


// Draws the specified character at the specified location in Mode 3
void drawCharWithBackground(int col, int row, char ch, unsigned short color, unsigned short bgColor) {
    for (int i = 0; i < 8; i++) {
        for (int j = 0; j < 6; j++) {
            if (fontdata_6x8[48 * ch + j + 6*i]) {
                setPixel(col + j, row + i, color);
            } else {
                setPixel(col + j, row + i, bgColor);
            }
        } // for
    } // for
}

void drawStringWithBackground(int col, int row, char *str, unsigned short color, unsigned short bgColor) {
    int currCol = col;
    char *ptr = str;
    while (*ptr != '\0') { // while the pointer is not pointing to null character
        drawCharWithBackground(currCol, row, *ptr, color, bgColor);     // draw char at current col
        currCol += 6;                            // increment col to next print location
        ptr += 1;                                // increment pointer to next memory location
    }
}