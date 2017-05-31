Role ioannis1.pg_compiler
=========

Installes extra packages needed to compile postgresql, compiles an arbitrary release, and installs the
postgres binaries and certtain extensions to the target directory. Documentation is not compiled nor installed.
Also compiles about a dozen popular applications like pgagent, pg_top, pgaudit, pg_repack, etc.
The main postgres source tree is compiled differently depending of its target platform, as follows:

  Debian:   ./configure  --with-readline     --with-openssl   --with-ldap 
  FreeBSD:  ./configure  --without-readline  --with-openssl   --with-pam   --with-libxml
  Darwin:   ./configure  --with-readline     --with-openssl   --with-pam   --with-ldap 

Pre-conditions:
  - Ability to fetch sources from github
  - Ability to fetch sources from PostgreSQL Extension Network . pgclient(1) need not pre-exist since
    it will be installed.

Post-conditions:
  -  ~postgres/dist-pg is symlinked to the installed postgres binaries
  - created directories /var/log/postgres ~postgres/src
  - Installed postgres binaries to target directory
  - Postgres documentation is absent
  - installed  specified  extensions.
  - Directories for github sources are created under directory ~postgres/src/



Requirements
------------

None.


Role Variables
--------------

These are the default values for the variables used:

github_repos:        false
pgdir:               pg-9.10
postgres_checkout:   master
pgxn_ext:
     - pgtap
     - semver
     - pg_stat_kcache
     - pg_qualstats


where,
'github_repos'       Fetches sources (but not compiles) for the dozen, or so, postgres applications.
'pgdir'              Is the target install directory for the postgres binaries. It is relative to ~postgres; 
                     therefore,it the default is actually ~postgres/pg-9.10
'postgres_checkout'  The tag release for the postgres sources to checkout for compilation, i.e. 'REL9_6_3' will
                     checkout the 9.6.3 release .
'pgxn_ext'           List of extensions to install


Dependencies
------------

None.

Example Playbook
----------------

    - hosts: servers
      roles:
         - { role: ioannis1.pg_compile, pgdir: pg-9.10 }

License
-------

BSD

Author Information
------------------
Ioannis Tambouras <ioannis@akroninc.net>
