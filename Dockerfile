FROM ruby:2.3.0

ENV APP_HOME=/myapp
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ENV BUNDLE_GEMFILE=$APP_HOME/Gemfile \
    BUNDLE_JOBS=2 \
    BUNDLE_PATH=/bundle

# Make it easy to bundle exec with alias 'be'
RUN echo 'alias be="bundle exec"' >> ~/.bashrc

COPY Gemfile* $APP_HOME/

RUN bundle install

COPY . $APP_HOME/

RUN apt-get update -qq
RUN apt-get install -y build-essential
RUN apt-get install -y libpq-dev
RUN apt-get install -y nodejs
