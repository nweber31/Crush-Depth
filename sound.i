# 1 "sound.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "sound.c"
# 1 "gba.h" 1




typedef signed char s8;
typedef unsigned char u8;
typedef signed short s16;
typedef unsigned short u16;
typedef signed int s32;
typedef unsigned int u32;
typedef signed long long s64;
typedef unsigned long long u64;
typedef void (*ihp_t)(void);






extern volatile unsigned short *videoBuffer;
# 40 "gba.h"
void waitForVBlank();
# 57 "gba.h"
int collision(int x1, int y1, int width1, int height1, int x2, int y2, int width2, int height2);
# 73 "gba.h"
extern unsigned short oldButtons;
extern unsigned short buttons;




typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;
extern DMA *dma;
# 105 "gba.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);
# 132 "gba.h"
typedef void (*ihp)(void);
# 2 "sound.c" 2
# 1 "sound.h" 1
void setupSounds();
void playSoundA(const signed char* sound, int length, int loops);
void playSoundB(const signed char* sound, int length, int loops);

void setupInterrupts();
void interruptHandler();

void pauseSound();
void unpauseSound();
void stopSound();
# 49 "sound.h"
typedef struct{
    const signed char* data;
    int length;
    int frequency;
    int isPlaying;
    int looping;
    int durationInVBlanks;
    int priority;
    int vBlankCount;
} SOUND;

SOUND soundA;
SOUND soundB;
# 3 "sound.c" 2

void setupSounds() {
    *(volatile u16 *)0x04000084 = (1<<7);

    *(volatile u16*)0x04000082 = (1<<1) |
                     (1<<2) |
                     (3<<8) |
                     (0<<10) |
                     (1<<11) |
                     (1<<3) |
                     (3<<12) |
                     (1<<14) |
                     (1<<15);

    *(u16*)0x04000080 = 0;
}

void playSoundA(const signed char* sound, int length, int loops) {
        dma[1].cnt = 0;

        int ticks = (16777216) / 11025;

        DMANow(1, sound, (u16*)0x040000A0, (2 << 21) | (3 << 28) | (1 << 25) | (1 << 26));

        *(volatile unsigned short*)0x4000102 = 0;

        *(volatile unsigned short*)0x4000100 = -ticks;
        *(volatile unsigned short*)0x4000102 = (1<<7);

        soundA.data = sound;
        soundA.length = length;
        soundA.looping = loops;
        soundA.durationInVBlanks = (((59.727) * length) / 11025);
        soundA.vBlankCount = 0;
        soundA.isPlaying = 1;
}


void playSoundB(const signed char* sound, int length, int loops) {
    dma[2].cnt = 0;

    int ticks = (16777216) / 11025;

    DMANow(2, sound, (u16*)0x040000A4, (2 << 21) | (3 << 28) | (1 << 25) | (1 << 26));

    *(volatile unsigned short*)0x4000106 = 0;

    *(volatile unsigned short*)0x4000104 = -ticks;
    *(volatile unsigned short*)0x4000106 = (1<<7);

    soundB.data = sound;
    soundB.length = length;
    soundB.looping = loops;
    soundB.durationInVBlanks = (((59.727) * length) / 11025);
    soundB.vBlankCount = 0;
    soundB.isPlaying = 1;
}

void setupInterrupts() {
 *(unsigned short*)0x4000208 = 0;
    *(unsigned short*)0x4000200 = (1 << 0) | (1 << ((2 % 4) + 3)) | (1 << ((3 % 4) + 3));
    *(unsigned short*)0x4000004 = (1 << 3);
    *((ihp*)0x03007FFC) = &interruptHandler;
 *(unsigned short*)0x4000208 = 1;
}

void interruptHandler() {

 *(unsigned short*)0x4000208 = 0;

 if (*(volatile unsigned short*)0x4000202 & (1 << 0)) {
        soundA.vBlankCount++;

        if (soundA.vBlankCount > soundA.durationInVBlanks) {
            if (soundA.looping == 1) {
                playSoundA(soundA.data, soundA.length, soundA.looping);
            } else {
                soundA.isPlaying = 0;
                dma[1].cnt = 0;
                *(volatile unsigned short*)0x4000102 = 0;
            }
        }


        soundB.vBlankCount++;
        if (soundB.vBlankCount > soundB.durationInVBlanks) {
            if (soundB.looping == 1) {
                playSoundB(soundB.data, soundB.length, soundB.looping);
            } else {
                soundB.isPlaying = 0;
                dma[2].cnt = 0;
                *(volatile unsigned short*)0x4000106 = 0;
            }
  }
 }
    *(volatile unsigned short*)0x4000202 = *(volatile unsigned short*)0x4000202;
    *(unsigned short*)0x4000208 = 1;
}

void pauseSound() {
    soundA.isPlaying = 0;
    *(volatile unsigned short*)0x4000102 = (0<<7);

    soundB.isPlaying = 0;
    *(volatile unsigned short*)0x4000106 = (0<<7);
}

void unpauseSound() {
    soundA.isPlaying = 1;
    *(volatile unsigned short*)0x4000102 = (1<<7);

    soundB.isPlaying = 1;
    *(volatile unsigned short*)0x4000106 = (1<<7);
}

void stopSound() {
    soundA.vBlankCount = 0;
    soundA.isPlaying = 0;
    dma[1].cnt = 0;
    *(volatile unsigned short*)0x4000102 = 0;

    soundB.vBlankCount = 0;
    soundB.isPlaying = 0;
    dma[2].cnt = 0;
    *(volatile unsigned short*)0x4000106 = 0;
}
