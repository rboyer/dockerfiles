#!/bin/sh

./bootstrap

mkdir -p build
cd build
../configure
make
