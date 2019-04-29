#!/bin/bash

# check or setup rpmbuild toos and stuff
sudo yum install -y rpmdevtools rpmlint selinux-policy-devel
[ ! -f ~/.rpmmacros ] && rpmdev-setuptree
TOPDIR=$(rpm --eval "%{_topdir}")
[ ! -d ${TOPDIR} ] && rpmdev-setuptree

# prepare files in the right place
cp -p src/* ${TOPDIR}/SOURCES
cd ${TOPDIR}/SPECS
mv ${TOPDIR}/SOURCES/bitcoin.spec . 

# do the job
rpmbuild --undefine=_disable_source_fetch -ba bitcoin.spec



