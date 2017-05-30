.PHONY:  $(shell ls)
.SILENT:
#gmake install  (or install-strip)
#gmake install-docs  
#gmake install-world   
#gmake distclean

ostype=`uname -s`

help:
	echo config install clean
all: clean config 
	make
	make -f ioannis.mk install

install: 
	make install-world
	make install-docs
clean:
	make distclean

config: 
	./configure \
	--with-includes=/opt/local/include \
	--prefix=/$(if $(ostype)=Linux,home,Users)/postgres/pg-9.10 \
	--with-libxml   \
	--with-libxslt  \
	--with-pam      \
	--with-openssl  \
	--with-ldap    

#--with-krb5     \
#--with-gssapi  

	#--with-system-tzdata=/usr/share/zoneinfo 


#--with-ossp-uuid   \
#--bindir=/usr/local/pgsql/bin   \
#--mandir=/usr/local/pgsql/man   \
#--docdir=/usr/local/pgsql/doc/postgresql   \
#--htmldir=/usr/local/pgsql/   \
#--with-pgport=5432   \
