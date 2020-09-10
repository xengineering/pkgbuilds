#!/bin/bash


PKG_NAME=$1


find . -type f -iname "$PKG_NAME*.pkg.tar.zst" | grep -v "./repos*."

