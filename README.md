Dragonfly Latex Templates
=========================

This package generates LaTeX class and style files to create documents in the 
format needed by Dragonfly Science.

## Installing the package

### Checking LaTeX
Before you can install the package you must check to make sure you
have the right version of LaTeX installed. To do this run the command:

        xelatex --version

Which should give the output

	    XeTeX 3.1415926-2.4-0.9998 (TeX Live 2012/Debian)
        kpathsea version 6.1.0
        Copyright 2012 SIL International and Jonathan Kew.
        There is NO warranty.  Redistribution of this software is
        covered by the terms of both the XeTeX copyright and
        the Lesser GNU General Public License.
        For more information about these matters, see the file
        named COPYING and the XeTeX source.
        Primary author of XeTeX: Jonathan Kew.
        Compiled with ICU version 49.1 [with modifications for XeTeX]
        Compiled with zlib version 1.2.3.4; using 1.2.3.4
        Compiled with FreeType2 version 2.4.8; using 2.4.8
        Compiled with fontconfig version 2.8.0; using 2.8.0
        Compiled with libpng version 1.2.46; using 1.2.46
        Compiled with poppler version 0.18.4


If you don't get that output you need to install the backport for
LaTeX. Open the file `/etc/apt/sources.list` and ensure that it
contains the line:

        deb http://packages.dragonfly.co.nz/texlive precise main

Then you will need to run

        sudo apt-get update
	    sudo apt-get upgrade

Now when you run `xelatex --version` you should get the same output as
above.

### Installing the Package
To install the package run the following commands

          git clone git@github.com:dragonfly-science/dragonfly-latex-templates.git
          cd dragonfly-latex-templates
          make pkg
          sudo dpkg -i ../dragonfly-latex-templates_1.0_all.deb

## Using the package

At this point the following latex classes will be available for you to use:

 - dragonfly-report
 - dragonfly-proposal
 - dragonfly-letter
 - aebr
 - dragonfly-article

You will also have access to the beamer theme `dragonfly` and the `dragonfly` package.

## Documentation

General documentation is generated in the file `dragonfly.pdf`. For each class format
there is an example tex file showing how it can be used. 

The example files are:

 - report.tex
 - proposal.tex
 - letter.tex
 - aebr.tex
 - presentation.tex
 - article.tex


## Incompatible Packages

The dragonfly templates package will not work correctly with the following packages:

 - subfig (use subcaption instead)


