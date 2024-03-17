
//{{BLOCK(bg)

//======================================================================
//
//	bg, 512x512@4, 
//	+ palette 256 entries, not compressed
//	+ 307 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x64 
//	Total size: 512 + 9824 + 8192 = 18528
//
//	Time-stamp: 2023-04-04, 18:19:19
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_BG_H
#define GRIT_BG_H

#define bgTilesLen 9824
extern const unsigned short bgTiles[4912];

#define bgMapLen 8192
extern const unsigned short bgMap[4096];

#define bgPalLen 512
extern const unsigned short bgPal[256];

#endif // GRIT_BG_H

//}}BLOCK(bg)
