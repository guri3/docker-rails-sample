FROM ruby:2.4.0

ENV APP_ROOT /web

RUN mkdir $APP_ROOT
WORKDIR $APP_ROOT
RUN \
  apt-get update && \
  apt-get install -y \
  build-essential \
  libpq-dev \
  nodejs

# install gem
COPY Gemfile $APP_ROOT
COPY Gemfile.lock $APP_ROOT
RUN bundle install --path vendor/bundle

COPY . $APP_ROOT
