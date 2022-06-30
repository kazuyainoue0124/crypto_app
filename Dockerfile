FROM ruby:3.1.2

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs default-mysql-client yarn
RUN apt-get install -y cron
RUN mkdir /workdir
WORKDIR /workdir

COPY Gemfile Gemfile.lock /workdir/

RUN gem install bundler
RUN bundle install
COPY . /workdir

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

RUN bundle exec whenever --update-crontab
CMD ["cron", "-f"]
CMD ["rails", "server", "-b", "0.0.0.0"]
