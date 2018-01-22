@echo off
set STARTTIME=%TIME%

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
  echo %~dp0
  git fetch
  git checkout master
  git branch -d %PROTOTAG%
  git checkout %PROTOTAG% -B %PROTOTAG%
)


if EXIST protocode (
  rd /q /s protocode
)

md protocode

cd proto
..\..\..\externals\protobuf\windows\protoc.exe --cpp_out=..\protocode *.proto

cd ..\..
echo ---------- end --------------


