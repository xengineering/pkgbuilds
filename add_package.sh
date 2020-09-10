#!/bin/bash


REPO=$1
ARCH=$2
PKG=$3

PREFIX="repos/$REPO/os/$ARCH"
DATABASE="$PREFIX/$REPO.db"
FILESTORAGE="$PREFIX/$REPO.files"


# make sure folders exist
mkdir -p $PREFIX

# add to database and re-sign database
repo-add $DATABASE.tar.zst $PKG
gpg -u xengineering --detach-sign -o $DATABASE.sig $DATABASE
gpg -u xengineering --detach-sign -o $FILESTORAGE.sig $FILESTORAGE

# copy package and signature to repository
cp $PKG $PREFIX/
cp $PKG.sig $PREFIX/

