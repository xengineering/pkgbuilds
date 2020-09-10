#!/bin/bash


REPO=$1  # provide repository name (e.g. 'xengineering') as first argument
ARCH=$2  # provide architecture (e.g. 'aarch64' or 'x86_64') as second argument
PKG=$3   # provide path to package (e.g. 'xengineering-base-meta/xengineering-base-meta-1.0.0-1-any.pkg.tar.zst') as third argument

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

