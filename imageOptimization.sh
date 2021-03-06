#!/bin/bash

############################################################################
#
# Author: Nil Portugués Calderó <contact@nilportugues.com>
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.
#
############################################################################
 
if [ "$UID" -ne "0" ]
then
  echo "" 
  echo "You must be sudoer or root. To run this script enter:"
  echo ""
  echo "sudo chmod +x $0; sudo ./$0"
  echo ""
  exit 1
fi

## JPEG-OPTIM
sudo apt-get install -y jpegoptim libjpeg-progs

## GITSICLE
sudo apt-get install -y gifsicle

## OPTI-PNG && ADVPNG
sudo apt-get install -y optipng advancecomp pngcrush pngtools

## PNGOUT
cd /tmp
sudo wget http://static.jonof.id.au/dl/kenutils/pngout-20130221-linux.tar.gz
sudo tar -xvf pngout-*-linux.tar.gz
sudo cp pngout-20130221-linux/x86_64/pngout /usr/bin/
sudo chmod +x /usr/bin/pngout
sudo rm -Rf /tmp/pngout-*

##Download DeflOpt. This tool (defopt) should be used right after compressing a PNG file for greater gains.
sudo apt-get install -y p7zip-full 
cd /tmp
sudo wget http://www.walbeehm.com/download/DeflOpt207.7z
sudo 7za e DeflOpt207.7z
mv DeflOpt.exe /usr/bin/deflopt
sudo chmod +x /usr/bin/deflopt
sudo rm -Rf /tmp/DeflOpt-*

## SVG Optimizer. Really worth it.
echo "\n" | sudo add-apt-repository ppa:svg-cleaner-team/svgcleaner
sudo apt-get update
sudo apt-get install -y svgcleaner


exit 0
