#!/bin/bash
set -ex
export RUN= 
export TEXINPUTS=.///:..//latex//:..//graphics//:..//biblatex-dragonfly//: 
make
cp dragonfly-latex-templates*.deb /output/

