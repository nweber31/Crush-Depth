
//{{BLOCK(puase)

//======================================================================
//
//	puase, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 150 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 4800 + 2048 = 7360
//
//	Time-stamp: 2023-04-04, 18:13:19
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_PUASE_H
#define GRIT_PUASE_H

#define puaseTilesLen 4800
extern const unsigned short puaseTiles[2400];

#define puaseMapLen 2048
extern const unsigned short puaseMap[1024];

#define puasePalLen 512
extern const unsigned short puasePal[256];

#endif // GRIT_PUASE_H

//}}BLOCK(puase)
