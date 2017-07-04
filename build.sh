#!/bin/bash
set -ex
export RUN= 
export TEXINPUTS=.///:..//latex//:..//graphics//: 
make
cp dragonfly-latex-templates*.deb /output/

