Dragonfly Latex Templates
=========================

This package generates LaTeX class and style files to create documents in the 
format needed at Dragonfly Data Science.

## Installing the package

1. Download the latest debian file from https://gorbachev.io/#/report/Dragonfly-Latex-Templates
2. Run `sudo dpkg -i dragonfly-latex-templates_XXX_all.deb`, where `XXX` is the version number of the package

## Using the package

At this point the following latex classes will be available for you to use:

 - dragonfly-report
 - dragonfly-proposal
 - dragonfly-letter
 - dragonfly-article

You will also have access to the beamer theme `dragonfly`.

## Documentation

General documentation is generated in the file `dragonfly.pdf`. For each class format
there is an example tex file (in the examples directory) showing how it can be used. 

## Incompatible Packages

The dragonfly templates package will not work correctly with the following packages:

 - subfig (use subcaption instead)

## Building the package on Ubuntu

1. Checkout the branch corresponding to the version of Ubuntu that you are using
(this makes sure that the right version of biber and biblatex are used).  
2. Run `make`. If you don't have access to docker.dragonfly.co.nz, run
    `export RUN= && export TEXINPUTS=.///:..//latex//:..//graphics//: && make`, 
    to build without using docker. You will neeed to have the `texlive-full` and `biber`
    packages installed.

