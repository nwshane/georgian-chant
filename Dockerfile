FROM ruby:2.3.0

# Setup app root directory
ENV APP_HOME=/myapp
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

# Setup bundling to work with /bundle volume
ENV BUNDLE_GEMFILE=$APP_HOME/Gemfile \
    BUNDLE_JOBS=2 \
    BUNDLE_PATH=/bundle

ADD . $APP_HOME

RUN bundle install

# Make it easy to bundle exec with alias 'be'
RUN echo 'alias be="bundle exec"' >> ~/.bashrc

########################################################################
# OTHER DEPENDENCIES BELOW
#
# Add other dependencies below this line, so that the bundle install
# step (which takes a long time) can be created from a cached container

RUN apt-get update -qq && apt-get install -y build-essential

# for postgres
RUN apt-get install -y libpq-dev

# for capybara-webkit
# RUN apt-get install -y libqt4-webkit libqt4-dev xvfb

# for a JS runtime
RUN apt-get install -y nodejs
