#! /bin/bash

tar -xzvf ./NachOS-4.1a.tar.gz
cd ./NachOS-4.1a/code/lib
sed -i "s/\/\/ sysdep.h/using namespace std;\n\/\/ sysdep.h/g" ./sysdep.h
sed -i "s/\#include \"iostream\.h\"/\#include \"iostream\"/g" ./sysdep.h
cd ../build.linux/
make depend

sed -i "s/CFLAGS = -ftemplate-depth-100 -Wno-deprecated -g -Wall -fwritable-strings \$(INCPATH) \$(DEFINES) \$(HOSTCFLAGS) -DCHANGED/CFLAGS = -ftemplate-depth-100 -Wno-deprecated -g -Wall \$(INCPATH) \$(DEFINES) \$(HOSTCFLAGS) -DCHANGED -fpermissive/g" ./Makefile

echo '/usr/bin/g++ -m32 "$@"' > ~/g++
chmod +x ~/g++
export PATH=$HOME:$PATH
make

sed -i "s/AS = as/AS = as --32/g" ./Makefile

make


./nachos



