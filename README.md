yage-meta
=========

collection of all yage modules, utility scripts and custom dependencies

:exclamation:CAUTION: code is extremly experimental, not stable, incorrect and changes very often:exclamation:

#### Ambient Occlusion with Sparse Voxel Texture
![Ambient Occlusion with Sparse Voxel Texture (Cornell Box like) Textures](https://cloud.githubusercontent.com/assets/1087418/6622803/3cdc12be-c8df-11e4-8b41-88eeb2b353a4.png)
![Ambient Occlusion with Sparse Voxel Texture (Sponza)](https://cloud.githubusercontent.com/assets/1087418/6622827/68cbe282-c8df-11e4-9b8e-6d49208d2be8.png)

#### Image Based Lighting
![Image Based Lighting](https://cloud.githubusercontent.com/assets/1087418/6622841/7f6660bc-c8df-11e4-83b5-817719e11ed4.png)


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


### Getting Started (~5')

* `git clone --recursive git@github.com:MaxDaten/yage-meta`
* `cd yage-meta`
* `./boot.hs sandbox init`

### Build Engine (~30')

* `cd yage`
* `cabal install --dependencies-only`
* `cabal install`

### Run Examples (~1')

_Most of the examples require at least OpenGL 4.4_

* `cd yage-examples`
* `cabal run yage-pbr`
