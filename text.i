# 1 "text.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "text.c"
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
# 2 "text.c" 2
# 1 "text.h" 1

void drawChar(int col, int row, char ch, unsigned short color);
void drawString(int col, int row, char *str, unsigned short color);
void drawCharWithBackground(int col, int row, char ch, unsigned short color, unsigned short bgColor);
void drawStringWithBackground(int col, int row, char *str, unsigned short color, unsigned short bgColor);
# 3 "text.c" 2
# 1 "font.h" 1

extern const unsigned char fontdata_6x8[12288];
# 4 "text.c" 2


void drawChar(int col, int row, char ch, unsigned short color) {
    for (int i = 0; i < 8; i++) {
        for (int j = 0; j < 6; j++) {
            if (fontdata_6x8[48 * ch + j + 6*i]) {
                setPixel(col + j, row + i, color);
            }
        }
    }
}


void drawString(int col, int row, char *str, unsigned short color) {
    int currCol = col;
    char *ptr = str;
    while (*ptr != '\0') {
        drawChar(currCol, row, *ptr, color);
        currCol += 6;
        ptr += 1;
    }
}



void drawCharWithBackground(int col, int row, char ch, unsigned short color, unsigned short bgColor) {
    for (int i = 0; i < 8; i++) {
        for (int j = 0; j < 6; j++) {
            if (fontdata_6x8[48 * ch + j + 6*i]) {
                setPixel(col + j, row + i, color);
            } else {
                setPixel(col + j, row + i, bgColor);
            }
        }
    }
}

void drawStringWithBackground(int col, int row, char *str, unsigned short color, unsigned short bgColor) {
    int currCol = col;
    char *ptr = str;
    while (*ptr != '\0') {
        drawCharWithBackground(currCol, row, *ptr, color, bgColor);
        currCol += 6;
        ptr += 1;
    }
}
