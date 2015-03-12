yage-meta
=========

collection of all yage modules and some utility scripts

:exclamation::exclamation::exclamation:**CAUTION: code is extremly experimental, not stable, incorrect and changes very often**:exclamation::exclamation::exclamation:

Windows
=======

- install custom `ekg-core` version with compile flag added for win32 - network - socket issues
- install `quine`

'quine' depends currently on sdl2 so install with e.g. 
	- cabal install sdl2 --extra-lib-dirs=C:\SDL2-2.0.3\include --extra-include-dirs=C:\SDL2-2.0.3\lib\x64

`or`

use custom quine with sdl stripped out (see MaxDaten/quine/stripped-sdl)

- install `typography-ft2`
- 