FROM debian:jessie
MAINTAINER Marcin Ryzycki | marcin.ryzycki@blackswan.com

RUN apt-get update \

  `# Add NodeJS and Yarn and Google Chrome apt sources...` \
  && apt-get install -y curl wget \
  && curl -sSL https://deb.nodesource.com/setup_6.x | bash - \
  && curl -sSL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && curl -sSL https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
  && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list \
  && apt-get update \

  `# Install basic tools, node, yarn, Chrome and Java (required by Selenium WebDriver)...` \
  && apt-get install -y git vim nodejs yarn chromium chromium-l10n google-chrome-stable xvfb default-jre \
    libgtk2.0-0 libnotify-dev libgconf-2-4 libnss3 libxss1 libasound2

ADD google-chrome.sh /usr/local/bin/google-chrome
