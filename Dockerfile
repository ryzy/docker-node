FROM debian:jessie
MAINTAINER Marcin Ryzycki | marcin.ryzycki@blackswan.com

RUN apt-get update \

  `# Add NodeJS and Yarn apt sources...` \
  && apt-get install -y curl wget \
  && curl -sL https://deb.nodesource.com/setup_6.x | bash - \
  && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && apt-get update \

  `# Install basic tools, node, yarn, Chrome and Java (required by Selenium WebDriver)...` \
  && apt-get install -y git vim nodejs yarn chromium chromium-l10n xvfb default-jre

ADD google-chrome.sh /usr/local/bin/google-chrome
