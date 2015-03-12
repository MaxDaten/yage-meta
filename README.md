yage-meta
=========

collection of all yage modules, utility scripts and custom dependencies

:exclamation:CAUTION: code is extremly experimental, not stable, incorrect and changes very often:exclamation:


## Getting Started (~ 1')

* `git clone --recursive git@github.com:MaxDaten/yage-meta`
* `cd yage-meta`
* `./boot.hs sandbox init`

## Build Engine (~ 30')

* `cd yage`
* `cabal install --dependencies-only`
* `cabal install`

## Run Examples (~ 1')

* `cd yage-examples`
* `cabal run yage-pbr`
