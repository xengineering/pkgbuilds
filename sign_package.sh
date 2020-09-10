#!/bin/bash


PKG=$1  # provide path to package (e.g. 'xengineering-base-meta/xengineering-base-meta-1.0.0-1-any.pkg.tar.zst') as argument


gpg -u xengineering --detach-sign -o $PKG.sig $PKG

