FROM centos:centos7
MAINTAINER Marcin Ryzycki | marcin.ryzycki@blackswan.com

# Add YUM node and yarn repos; install NodeJS and yarn.
RUN curl --silent --location https://rpm.nodesource.com/setup_6.x | bash - \
  && curl --silent --location https://dl.yarnpkg.com/rpm/yarn.repo -o /etc/yum.repos.d/yarn.repo \
  && yum update -y \
  && yum install -y epel-release \
  `# Install basic system tools + dev tools to build some native NodeJS addons... ` \
  && yum install -y iproute which jq gcc gcc-c++ make libffi-devel libpng-devel zlib-devel \
  `# Install NodeJS (latest LTS from EPEL repository) and yarn package manager...` \
  && yum install -y node yarn \
  && yum clean all \
  `# Display version of installed tools...` \
  && echo -n 'NodeJS' && node -v && echo -n 'NPM' && npm -v && echo -n 'yarn' && yarn version
