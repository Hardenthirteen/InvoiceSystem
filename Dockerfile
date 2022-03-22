FROM ruby:2.7.2
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN mkdir /InvoiceSystem
WORKDIR /InvoiceSystem
ADD Gemfile /InvoiceSystem/Gemfile
RUN gem install bundler
RUN bundle install
ADD . /InvoiceSystem