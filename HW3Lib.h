#ifndef HW_LIB_H
#define HW_LIB_H

// Common Typedefs
typedef unsigned short u16;

// Common Macros
#define OFFSET(col,row,rowlen) ((row)*(rowlen)+(col))

// ================================= DISPLAY ==================================

// Display Control Register
#define REG_DISPCTL (*(unsigned short *)0x4000000)
#define MODE3 3
#define BG2_ENABLE (1<<10)

// Display Status Registers
#define SCANLINECOUNTER (*(volatile unsigned short *)0x4000006)

// Display Constants
#define SCREENHEIGHT 160
#define SCREENWIDTH 240

// Sound Control Registers
#define REG_SOUNDCNT_X *(volatile u16*)0x04000084
#define SND_ENABLED (1<<7)
#define REG_SOUNDCNT_L *(volatile u16*)0x04000080 
#define REG_SOUNDCNT_H *(volatile u16*)0x04000082 // bits 0-1 are DMG sound volume. 00 => 25%, 01 => 50%, 10 => 100%


// Other Sound Macros
#define REG_SND1SWEEP *(volatile u16*)0x04000060
#define REG_SND1CNT *(volatile u16*)0x04000062
#define REG_SND1FREQ *(volatile u16*)0x04000064
#define REG_SND2CNT *(volatile u16*)0x04000068
#define REG_SND2FREQ *(volatile u16*)0x0400006C
#define REG_SND3SEL *(volatile u16*)0x04000070
#define REG_SND3CNT *(volatile u16*)0x04000072
#define REG_SND3FREQ *(volatile u16*)0x04000074
#define REG_SND4CNT *(volatile u16*)0x04000078
#define REG_SND4FREQ *(volatile u16*)0x0400007C

// Channel 3 Wave Pattern RAM (2 banks!!)
#define REG_SND3_WAV *(volatile u16*)0x04000090
#define DMG_SND1_LEFT (1 << 8)
#define DMG_SND2_LEFT (1 << 9)
#define DMG_SND3_LEFT (1 << 10)
#define DMG_SND4_LEFT (1 << 11)
#define DMG_SND1_RIGHT (1 << 12)
#define DMG_SND2_RIGHT (1 << 13)

#define DMG_SND3_RIGHT (1 << 14)
#define DMG_SND4_RIGHT (1 << 15)

// n: [0-7]
#define DMG_VOL_LEFT(n) (((n) & 7) << 0)
#define DMG_VOL_RIGHT(n) (((n) & 7) << 4)

// n: [0-15]
#define DMG_ENV_VOL(n) (((n) & 15) << 12)

// n: [0-7]
#define DMG_STEP_TIME(n) (((n) & 7) << 8)
#define DMG_DIRECTION_DECR (0 << 11)
#define DMG_DIRECTION_INCR (1 << 11)
#define DMG_DUTY_12 (0 << 6)
#define DMG_DUTY_25 (1 << 6)
#define DMG_DUTY_50 (2 << 6)
#define DMG_DUTY_75 (3 << 6)

// n: [0-2]
#define DMG_MASTER_VOL(n) ((n) % 3)
#define SND_RESET (1<<15)

// Video Buffer
extern volatile unsigned short *videoBuffer;

// Color
#define COLOR(r,g,b) ((r) | (g)<<5 | (b)<<10)
#define BLACK 0
#define WHITE COLOR(31,31,31)
#define GRAY COLOR(15,15,15)
#define RED COLOR(31,0,0)
#define GREEN COLOR(0,31,0)
#define BLUE COLOR(0,0,31)
#define CYAN COLOR(0,31,31)
#define MAGENTA COLOR(31,0,31)
#define YELLOW COLOR(31,31,0)
#define PINK COLOR(31, 23, 23)
#define GOLD COLOR(31, 29, 17)

// Mode 3 Drawing Functions
void setPixel(int col, int row, unsigned short color);
void drawRect(int col, int row, int width, int height, unsigned short color);
void fillScreen(unsigned short color);

// Miscellaneous Drawing Functions
void waitForVBlank();

// ================================== INPUT ===================================

// Button Register
#define BUTTONS (*(volatile unsigned short *)0x04000130)

// Button Masks
#define BUTTON_A		(1<<0)
#define BUTTON_B		(1<<1)
#define BUTTON_SELECT	(1<<2)
#define BUTTON_START	(1<<3)
#define BUTTON_RIGHT	(1<<4)
#define BUTTON_LEFT		(1<<5)
#define BUTTON_UP		(1<<6)
#define BUTTON_DOWN		(1<<7)
#define BUTTON_R		(1<<8)
#define BUTTON_L		(1<<9)

// Variables for Button Macros
extern unsigned short oldButtons;
extern unsigned short buttons;

// Button Macros
#define BUTTON_HELD(key)  (~(BUTTONS) & (key))
#define BUTTON_PRESSED(key) (!(~(oldButtons)&(key)) && (~buttons & (key)))

// ============================== MISCELLANEOUS ===============================

// Miscellaneous Functions
int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
#endif