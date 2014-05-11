Dragonfly Latex Templates
=========================

This package generates LaTeX class and style files to create documents in the 
format needed by Dragonfly Science.

## Installing the package

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


