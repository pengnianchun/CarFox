@echo off
set STARTTIME=%TIME%
setlocal enabledelayedexpansion

set PROTOTAG=%1
set PROTOORIGIN="ssh://git@192.168.3.200:10022/qt/protofile.git"
::git checkout %PROTOTAG%

::git pull ssh://git@192.168.3.200:10022/qt/protofile.git master
echo ---------- start  --------------
echo %~dp0 

if NOT EXIST protofile (
  echo "not found protofile, now download..."
  git clone %PROTOORIGIN% -b master
  cd protofile
  git checkout %PROTOTAG% -B %PROTOTAG%
) else (
  echo found extracted sources
  cd protofile
  git checkout .
  git reset HEAD .
  git clean -df
  git checkout master
  git branch -D %PROTOTAG%
  echo %~dp0
  git fetch
  git checkout %PROTOTAG% -B %PROTOTAG%
)


if EXIST protocode (
  rd /q /s protocode
)

md protocode

cd proto
..\..\..\externals\protobuf\windows\protoc.exe --cpp_out=..\protocode *.proto

cd ../protocode
echo #ifndef _PROTOBUF_HEADERS_H_ > protoheader.h
echo #define _PROTOBUF_HEADERS_H_ >> protoheader.h
echo.>> protoheader.h

for /f %%i in ('dir /b *.pb.h') do (
  echo #include "%%i" >> protoheader.h
)
echo.>> protoheader.h
echo #endif //_PROTOBUF_HEADERS_H_ >> protoheader.h

cd ..\..
echo ---------- end --------------

