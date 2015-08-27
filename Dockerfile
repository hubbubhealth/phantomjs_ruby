FROM ruby:2.1

RUN apt-get update && apt-get install -y build-essential g++

# Install postgres nokogiri and sprokets dependencies
RUN apt-get install -y libpq-dev \
    libxml2-dev libxslt1-dev \
    nodejs

# Install phantomjs dependencies
RUN apt-get install -y libfreetype6 libfontconfig bzip2 wget

# Install phantomjs 1.9.6
RUN mkdir -p /srv/var
RUN wget -q -O /tmp/phantomjs-1.9.6-linux-x86_64.tar.bz2 https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-1.9.6-linux-x86_64.tar.bz2
RUN tar -xjf /tmp/phantomjs-1.9.6-linux-x86_64.tar.bz2 -C /tmp
RUN rm -f /tmp/phantomjs-1.9.6-linux-x86_64.tar.bz2
RUN mv /tmp/phantomjs-1.9.6-linux-x86_64/ /srv/var/phantomjs
RUN ln -s /srv/var/phantomjs/bin/phantomjs /usr/bin/phantomjs

RUN apt-get autoremove -y && apt-get clean all
