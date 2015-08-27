FROM ruby:latest

RUN apt-get update && apt-get install -y build-essential g++

# Install postgres nokogiri and sprokets dependencies
RUN apt-get install -y libpq-dev \
    libxml2-dev libxslt1-dev \
    nodejs

# Install phantomjs 1.9.6
RUN apt-get install -y libfreetype6 libfontconfig bzip2 wget && \
    mkdir -p /srv/var && \
    wget -q --no-check-certificate -O /tmp/phantomjs-1.9.6-linux-x86_64.tar.bz2 https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-1.9.6-linux-x86_64.tar.bz2 && \
    tar -xjf /tmp/phantomjs-1.9.6-linux-x86_64.tar.bz2 -C /tmp && \
    rm -f /tmp/phantomjs-1.9.6-linux-x86_64.tar.bz2 && \
    mv /tmp/phantomjs-1.9.6-linux-x86_64/ /srv/var/phantomjs && \
    ln -s /srv/var/phantomjs/bin/phantomjs /usr/bin/phantomjs && \
    apt-get autoremove -y && apt-get clean all
