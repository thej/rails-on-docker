FROM ruby:2.2

RUN apt-get update -qq && apt-get install -y build-essential nodejs

# for postgres
# RUN apt-get install -y libpq-dev

# for nokogiri
# RUN apt-get install -y libxml2-dev libxslt1-dev

# for capybara-webkit
# RUN apt-get install -y libqt4-webkit libqt4-dev xvfb

ENV APP_HOME /app
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME/
RUN bundle install

ADD . $APP_HOME
