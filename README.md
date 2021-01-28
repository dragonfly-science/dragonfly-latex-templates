Dragonfly Latex Templates
=========================

This package generates LaTeX class and style files to create documents in the 
format needed at Dragonfly Data Science.

## Installing the package on debian

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

## Modifying the package

Key files for the template are found in the `dragonfly` folder. Make sure to update
the changelog to a new version number following any edits (see `package/debian/changelog`).
The new version number will be used when the `.deb` is generated.

## Building the package on Ubuntu

1. Checkout the branch corresponding to the version of Ubuntu that you are using
(this makes sure that the right version of biber and biblatex are used).  
2. Edit package/debian/changelog to update version
3. Run `make`. If you don't have access to docker.dragonfly.co.nz, 
    run `export RUN= && export TEXINPUTS=.///:..//latex//:..//graphics//: && make`, 
    to build without using docker. You will neeed to have the `texlive-full` and `biber`
    packages installed.

## Update Dragonfly docker image to reflect change

1. Copy new dragonfly-latex-templates_[version]_all.deb to docker.dragonfly.co.nz/dragonfly-reports/
2. Edit the version of dragonfly-latex-templates_[version]_all.deb in docker.dragonfly.co.nz/dragonfly-reports/Dockerfile
3. Run make at the root of docker.dragonfly.co.nz
