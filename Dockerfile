# Make sure RUBY_VERSION matches the Ruby version in .ruby-version and Gemfile
ARG RUBY_VERSION=3.2
FROM ruby:$RUBY_VERSION

# Install packages needed to build gems
RUN apt-get update -qq && apt-get install -y \
  libssl-dev \
  libvips \
  apt-utils \
  build-essential \
  default-libmysqlclient-dev

# Run git with a new branch
RUN git config --global init.defaultBranch main

# Update Ruby dependency manager
RUN gem update --system
RUN gem install bundler

# Check rails presense
ARG RAILS_VERSION=7.0.7.2
RUN gem install rails -v=$RAILS_VERSION

# Docker configuration
WORKDIR /usr/src/peeper