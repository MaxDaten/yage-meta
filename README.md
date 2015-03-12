yage-meta
=========

collection of all yage modules, utility scripts and custom dependencies

:exclamation:CAUTION: code is extremly experimental, not stable, incorrect and changes very often:exclamation:

### Project Overview

This meta project collects all modules of the engine plus some additional customized dependencies.

The engine modules are prefixed with `yage` and are:
<dl>
  <dt>yage</dt>
  <dd>the main engine module which runs the graphic pipeline and application wires. It's the junction point of other sub modules</dd>
  <dt>yage-core</dt>
  <dd>window creation and input handling</dd>
  <dt>yage-geometry</dt>
  <dd>library for geometric mathematics and geometric types</dd>
  <dt>yage-contrib</dt>
  <dd>custom prelude, other utilities and orphan instances</dd>
  <dt>yage-examples</dt>
  <dd>running examples to render fancy images on the screen</dd>
</dl>


### Getting Started (~1')

* `git clone --recursive git@github.com:MaxDaten/yage-meta`
* `cd yage-meta`
* `./boot.hs sandbox init`

### Build Engine (~ 30')

* `cd yage`
* `cabal install --dependencies-only`
* `cabal install`

### Run Examples (~ 1')

* `cd yage-examples`
* `cabal run yage-pbr`
