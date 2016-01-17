#!/bin/bash
shopt -s extglob

if [ ! -e "styrdokument" ]; then
  git clone git://github.com/datasektionen/styrdokument.git
fi

tlmgr install titlesec lastpage

(
  cd styrdokument
  git fetch origin master
  git reset --hard origin/master
  make clean pdf textile toc
  cp *.pdf ../public
  cp *.textile ../views

  for file in `ls +(!(*toc*)textile)|sed -e 's/.textile//'`; do
    document="../views/$file.textile";
    echo '<div class="pull-right toc">' > $document;
    echo '' >> $document;
    cat $file.toc.textile >> $document;
    echo '</div>' >> $document;
    echo '' >> $document;
    cat $file.textile >> $document;
  done
)
