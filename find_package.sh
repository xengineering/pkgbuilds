#!/bin/bash


PKG_NAME=$1  # provide the package name as argument


find . -type f -iname "$PKG_NAME*.pkg.tar.zst" | grep -v "./repos*."

