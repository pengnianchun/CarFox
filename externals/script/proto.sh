#!/bin/sh

PROTOFILE=$PWD
PROTOTAG=$1
PROTOORIGIN="ssh://git@192.168.3.200:10022/qt/protofile.git"

if [ -d $PROTOFILE/protofile ]; then
    cd $PROTOFILE/protofile
    git fetch
    git checkout master
    git branch -d $PROTOTAG
    git checkout $PROTOTAG -B $PROTOTAG
else
    git clone $PROTOORIGIN -b master
    cd $PROTOFILE/protofile
    git checkout $PROTOTAG -b $PROTOTAG
fi

rm ./protocode -rf && mkdir -p ./protocode
LD_LIBRARY_PATH=../../externals/protobuf/linux/lib/x86:$LD_LIBRARY_PATH ../../externals/protobuf/linux/protoc -I=$PROTOFILE/protofile/proto --cpp_out=./protocode $PROTOFILE/protofile/proto/*.proto


#generate protoheader.h include all pb.h
cd protocode

INCLUDEHEADERS=`ls *.pb.h`

echo "#ifndef _PROTOBUF_HEADERS_H_" > protoheader.h
echo "#define _PROTOBUF_HEADERS_H_ " >> protoheader.h
echo "" >> protoheader.h
for file in $INCLUDEHEADERS
do
    echo "#include \"$file\"" >> protoheader.h
done
echo "" >> protoheader.h
echo "#endif //_PROTOBUF_HEADERS_H_" >> protoheader.h
