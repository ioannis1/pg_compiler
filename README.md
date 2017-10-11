Role ioannis1.pg_compiler
=========

Installes extra packages needed to compile postgresql, compiles an arbitrary release, and installs the
postgres binaries and certtain extensions to the target directory. Documentation is not compiled nor installed.
Also compiles about a dozen popular applications like pgagent, pg_top, pgaudit, pg_repack, etc.
The main postgres source tree is compiled differently depending of its target platform, as follows:

  FreeBSD:  ./configure  --without-readline  --with-openssl   --with-libxml  --with-pam  
  Debian:   ./configure  --with-readline     --with-openssl   --with-ldap 
  Darwin:   ./configure  --with-readline     --with-openssl   --with-ldap    --with-pam

Pre-conditions:
  - Ability to fetch sources from github
  - Ability to fetch sources from PostgreSQL Extension Network . pgclient(1) need not pre-exist since
    it will be installed.

Post-conditions:
  - Symbolic link ~postgres/dist-pg points to the installed postgres binaries
  - Created directories /var/log/postgres ~postgres/src
  - Installed postgres binaries to target directory
  - Postgres documentation is absent
  - Installed  specified  extensions.
  - Directories for github sources are created under directory ~postgres/src/



Requirements
------------

None.


Role Variables
--------------

These are the default values for the variables used:

github_repos:        false
postgres_checkout:   master
pgxn_ext:            [ pgtap, semver, pg_stat_kcache, pg_qualstats ]


where,
'github_repos'       Fetches sources (but not compiles) for the dozen, or so, postgres applications.
'postgres_checkout'  The tag for the postgres sources to checkout for compilation.
'pgxn_ext'           List of extensions to install


Dependencies
------------

None.

Example Playbook
----------------

    - hosts: servers
      roles:
         - { role: ioannis1.pg_compile,    postgres_checkout: REL_10_BETA1 }

License
-------

BSD

Author Information
------------------
Ioannis Tambouras <ioannis@akroninc.net>
