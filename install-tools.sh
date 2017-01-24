#!/usr/bin/env bash

export GIT_VERSION="2.11.0"

# Install necessary dev tools for build.
# Some of them are needed to build native NodeJS modules.
yum install -y automake autoconf gcc gcc-c++ curl-devel expat-devel gettext-devel libffi-devel \
               libpng-devel libtoolize openssl-devel perl-ExtUtils-MakeMaker zlib-devel


echo "Installing Git ${GIT_VERSION}..."
cd /tmp
wget https://www.kernel.org/pub/software/scm/git/git-$GIT_VERSION.tar.gz
tar -zxf git-$GIT_VERSION.tar.gz --no-same-owner
cd git-$GIT_VERSION
make prefix=/usr/local all
make prefix=/usr/local install
rm -rf /tmp/git* && echo && echo &&
cd /
echo "Git ${GIT_VERSION} installed."
git || true && git version
