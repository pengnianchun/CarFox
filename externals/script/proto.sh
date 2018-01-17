#!/bin/sh

PROTOFILE=$PWD
PROTOTAG=$1

if [ -d $PROTOFILE/protofile ]; then
    cd $PROTOFILE/protofile
    git pull ssh://git@192.168.3.200:10022/qt/protofile.git master
    git checkout $PROTOTAG
else
    git clone ssh://git@192.168.3.200:10022/qt/protofile.git -b master
    cd $PROTOFILE/protofile
    git checkout $PROTOTAG -b $PROTOTAG
fi

rm ./protocode -rf && mkdir -p ./protocode
LD_LIBRARY_PATH=../../externals/protobuf/linux:$LD_LIBRARY_PATH ../../externals/protobuf/linux/protoc -I=$PROTOFILE/protofile/proto --cpp_out=./protocode $PROTOFILE/protofile/proto/*.proto
