FROM node:8
MAINTAINER Michael Novi <mike@lab651.com>

RUN apt-get -y update &&\
  apt-get -y install apt-transport-https

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - &&\ 
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list &&\
  apt-get -y update &&\
  apt-get -y install yarn

# COPY package.json /usr/src/app/
# COPY yarn.lock /usr/src/app/
WORKDIR /usr/src/app
# RUN yarn check || yarn install

COPY . /usr/src/app
