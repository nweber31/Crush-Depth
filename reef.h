
//{{BLOCK(reef)

//======================================================================
//
//	reef, 512x512@4, 
//	+ palette 256 entries, not compressed
//	+ 1429 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x64 
//	Total size: 512 + 45728 + 8192 = 54432
//
//	Time-stamp: 2023-05-02, 18:51:34
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_REEF_H
#define GRIT_REEF_H

#define reefTilesLen 45728
extern const unsigned short reefTiles[22864];

#define reefMapLen 8192
extern const unsigned short reefMap[4096];

#define reefPalLen 512
extern const unsigned short reefPal[256];

#endif // GRIT_REEF_H

//}}BLOCK(reef)
