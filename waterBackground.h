
//{{BLOCK(waterBackground)

//======================================================================
//
//	waterBackground, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 322 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 10304 + 2048 = 12864
//
//	Time-stamp: 2023-05-02, 09:41:15
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_WATERBACKGROUND_H
#define GRIT_WATERBACKGROUND_H

#define waterBackgroundTilesLen 10304
extern const unsigned short waterBackgroundTiles[5152];

#define waterBackgroundMapLen 2048
extern const unsigned short waterBackgroundMap[1024];

#define waterBackgroundPalLen 512
extern const unsigned short waterBackgroundPal[256];

#endif // GRIT_WATERBACKGROUND_H

//}}BLOCK(waterBackground)
