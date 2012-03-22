#!/bin/bash

if [ ! -e "styrdokument" ]; then
  git clone git://github.com/datasektionen/styrdokument.git
fi

(
  cd styrdokument
  git pull
  make
  make textile
  make toc
  cp *.pdf ../public
  cp *.textile ../views
)
