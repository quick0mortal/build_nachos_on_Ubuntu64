# /bin/bash

mv ./mips-decstation.linux-xgcc.tar.gz /

cd /
tar -xzvf /mips-decstation.linux-xgcc.tar.gz 

cd -

cd ./NachOS-4.1a/coff2noff/

./configure

sed -i "s/CFLAGS= -g -O2 -DRDATA -DHAVE_CONFIG_H -I@top_dir@/CFLAGS= -g -O2 -m32 -DRDATA -DHAVE_CONFIG_H -I@top_dir@/g" ./Makefile

sed -i "s/LD=gcc/LD=gcc -m32/g" ./Makefile

make

cd ./../code/test

sed -i "s/\#CPP = \/usr\/local\/nachos\/lib\/gcc-lib\/decstation-ultrix\/2.95.2\/cpp/CPP = \/usr\/local\/nachos\/lib\/gcc-lib\/decstation-ultrix\/2.95.2\/cpp/g" ./Makefile.dep

sed -i "s/CPP = \/usr\/local\/nachos\/current\/lib\/gcc-lib\/decstation-ultrix\/2.7.2.1\/cpp/\#CPP = \/usr\/local\/nachos\/current\/lib\/gcc-lib\/decstation-ultrix\/2.7.2.1\/cpp/g" ./Makefile.dep

sed -i "s/\#GCCDIR = \/usr\/local\/nachos\/bin\/decstation-ultrix-/GCCDIR = \/usr\/local\/nachos\/bin\/decstation-ultrix-/g" ./Makefile.dep

sed -i "s/GCCDIR = \/usr\/local\/nachos\/current\/bin\/decstation-ultrix-/\#GCCDIR = \/usr\/local\/nachos\/current\/bin\/decstation-ultrix-/g" ./Makefile.dep

make



