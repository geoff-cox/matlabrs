#!/bin/bash

echo
echo NOTE: If you get non-pretext errors when running this bash, try running [dos2unix compile.sh] first.
echo

cd BOOK-OUTPUT

if [ $# == 0 ]
then
  echo Processing basic pretext file ...
  xsltproc --xinclude -stringparam publisher matlab-pub.xml /mathbook/xsl/pretext-html.xsl ../matlab-book-main.xml
  #python3 /mnt/c/Users/gcox0/'Google Drive'/1--MATLAB_textbook/4--master_copy/matlab-ebook/parsing-code/convert_evalsage_button_text.py /mnt/c/Users/gcox0/'Google Drive'/1--MATLAB_textbook/4--master_copy/matlab-ebook/BOOK-OUTPUT/ 'Evaluate \(Octave\)' 'Run Commands'
  python3 ../parsing-code/convert_evalsage_button_text.py ../BOOK-OUTPUT/ 'Evaluate \(Octave\)' 'Run Commands'
else

  for arg in $@
  do

    if [ $arg == '-server' ]
    then
      echo "Starting local test server..."
      echo
      echo "          Ctrl + Click : http://localhost:8080/"
      echo
      #/mnt/c/'Program Files (x86)'/Google/Chrome/Application/chrome.exe "localhost:8080"  <----- Not working ATM
      python3 -m http.server 8080
    fi

    if [ $arg == '-ww' ]
    then
      echo Processing webwork problems ...
      /mathbook/pretext/pretext -c webwork -s https://webwork-ptx.aimath.org -d ../ww-extraction ../matlab-book-main.xml
      #/mathbook/pretext/pretext -c webwork -s https://mathblox.org -d ../ww-extraction ../matlab-book-main.xml
    fi

    if [ $arg == '-s' ]
    then
      echo Processing xml ...
      xsltproc --xinclude -stringparam publisher matlab-pub.xml /mathbook/xsl/pretext-html.xsl ../matlab-book-main.xml
      echo Processing sageplot components ...
      /mathbook/pretext/pretext -c sageplot -f svg -d images ../matlab-book-main.xml
      echo Re-processing xml ...
      xsltproc --xinclude -stringparam publisher matlab-pub.xml /mathbook/xsl/pretext-html.xsl ../matlab-book-main.xml

    fi
    
    #if [ $arg == '-a' ]
    #then
    #  echo Processing asymptote components ...
    #  /mathbook/pretext/pretext -vv -c asy -f svg -d images ../matlab-book-main.xml
    #  
    #fi

    if [ $arg == '-s-v' ]
    then
      echo Processing xml ...
      xsltproc --xinclude -stringparam publisher matlab-pub.xml /mathbook/xsl/pretext-html.xsl ../matlab-book-main.xml
      echo Processing sageplot components <verbose mode> ...
      /mathbook/pretext/pretext -v -c sageplot -f svg -d images ../matlab-book-main.xml
      echo Re-processing xml ...
      xsltproc --xinclude -stringparam publisher matlab-pub.xml /mathbook/xsl/pretext-html.xsl ../matlab-book-main.xml
    fi

    if [ $arg == '-s-d' ]
    then
      echo Processing xml ...
      xsltproc --xinclude -stringparam publisher matlab-pub.xml /mathbook/xsl/pretext-html.xsl ../matlab-book-main.xml
      echo Processing sageplot components <debug mode> ...
      /mathbook/pretext/pretext -vv -c sageplot -f svg -d images ../matlab-book-main.xml
      echo Re-processing xml ...
      xsltproc --xinclude -stringparam publisher matlab-pub.xml /mathbook/xsl/pretext-html.xsl ../matlab-book-main.xml
    fi

    if [ $arg == '-l' ]
    then
      echo Processing latex-image components ...
      /mathbook/pretext/pretext -c latex-image -f svg -d images ../matlab-book-main.xml
      echo Processing xml ...
      xsltproc --xinclude -stringparam publisher matlab-pub.xml /mathbook/xsl/pretext-html.xsl ../matlab-book-main.xml
    fi

    if [ $arg == '-l-v' ]
    then
      echo Processing latex-image components <verbose mode> ...
      /mathbook/pretext/pretext -v -c latex-image -f svg -d images ../matlab-book-main.xml
      echo Re-processing xml ...
      xsltproc --xinclude -stringparam publisher matlab-pub.xml /mathbook/xsl/pretext-html.xsl ../matlab-book-main.xml
    fi

    if [ $arg == '-l-d' ]
    then
      echo Processing latex-image components <debug mode> ...
      /mathbook/pretext/pretext -vv -c latex-image -f svg -d images ../matlab-book-main.xml
      echo Re-processing xml ...
      xsltproc --xinclude -stringparam publisher matlab-pub.xml /mathbook/xsl/pretext-html.xsl ../matlab-book-main.xml
    fi

    if [ $arg == '-h' ]
    then
      echo "HELP:"
      echo "-ww  : processes pretext and updates webwork. Run only when you add new or make changes to webwork problems."
      echo "-s   : processes pretext with sageplots. Slow, only use when necessary."
      echo "-s-v : processes pretext with sageplots <verbose mode>. Provides success/fail feedback."
      echo "-s-d : processes pretext with sageplots <debug mode>. Provides detailed processing info."
      echo "-l   : processes pretext with latex-plots. Slow, only use when necessary."
      echo "-l-v : processes pretext with latex-plots <verbose mode>. Provides success/fail feedback."
      echo "-l-d : processes pretext with latex-plots <debug mode>. Provides detailed processing info."
      echo "-pdf : creates a pdf version of the book."
      echo "-server : starts http://localhost:8080/ server for testing."
    fi

    if [ $arg == '-tex' ]
    then
      echo Converting XML to tex...
      xsltproc -o matlab-book-main.tex --xinclude -stringparam publisher matlab-pub.xml /mathbook/xsl/pretext-latex.xsl ../matlab-book-main.xml
      pdflatex -interaction=nonstopmode matlab-book-main.tex
    fi

    if [ $arg == '-upload' ]
    then
      echo Uploading book to mathblox server...
      scp -r *.html figures knowl images ww-extraction root@142.11.213.85:/var/www/html/DE_BOOK/matlab-ebook/
      ssh root@142.11.213.85 chmod -R u=rwx,go=rx /var/www/html/DE_BOOK/matlab-ebook
    fi
      
  done
fi
echo
date
echo
cd ..
