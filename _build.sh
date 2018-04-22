#!/bin/sh

Rscript -e "install.packages('bookdown')"
Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::gitbook')"
