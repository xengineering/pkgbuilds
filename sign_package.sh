#!/bin/bash


PKG=$1


gpg -u xengineering --detach-sign -o $PKG.sig $PKG

