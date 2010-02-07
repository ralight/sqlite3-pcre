CC=cc
INSTALL=install
CFLAGS=$(shell pkg-config --cflags sqlite3 libpcre) -fPIC
LIBS=$(shell pkg-config --libs libpcre)
prefix=/usr
.PHONY : install clean

pcre.so : pcre.c
	${CC} -shared -o $@ ${CFLAGS} -W -Werror pcre.c ${LIBS} -Wl,-z,defs

install : pcre.so
	${INSTALL} -pD -m755 pcre.so ${DESTDIR}${prefix}/lib/sqlite3/pcre.so

clean :
	-rm -f pcre.so
