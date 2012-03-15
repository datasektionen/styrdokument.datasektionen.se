#!/bin/bash

if [[ ! -e "styrdokument" ]]; then
  git clone git://github.com/datasektionen/styrdokument.git
fi

(
  cd styrdokument
  git pull
  make
  cp *.pdf ../public

  ./textilize.rb stadgar.tex
  ./textilize.rb reglemente.tex
  cp *.textile ../views
)
