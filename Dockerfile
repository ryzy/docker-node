FROM centos:centos7
MAINTAINER Marcin Ryzycki | marcin.ryzycki@blackswan.com

ADD install-tools.sh /

# Add YUM node and yarn repos; install NodeJS and yarn.
RUN curl --silent --location https://rpm.nodesource.com/setup_6.x | bash - \
  && curl --silent --location https://dl.yarnpkg.com/rpm/yarn.repo -o /etc/yum.repos.d/yarn.repo \
  && yum update -y \
  && yum install -y epel-release \

  `# Install some basic web-related tools...` \
  && yum install -y iproute which wget patch jq tar bzip2 unzip openssh-clients MariaDB-client \
  `# Install NodeJS (latest LTS from EPEL repository) and yarn package manager...` \
  && yum install -y nodejs yarn \

  `# Install other tools (e.g. newest git, not available in YUM repo)` \
  && chmod +x install-tools.sh && /install-tools.sh \

  && yum clean all \
  `# Display version of installed tools...` \
  && echo -n 'NodeJS ' && node -v && echo -n 'NPM ' && npm -v && echo -n 'yarn ' && yarn version
