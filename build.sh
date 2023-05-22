#!/bin/bash
set -ex
export RUN= 
export TEXINPUTS=.///:..//latex//:..//graphics//: 
make clean
make
cp dragonfly-latex-templates*.deb /output/

