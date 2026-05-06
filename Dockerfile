FROM ruby:3.4.5

RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  nodejs \
  npm \
  postgresql-client \
  nginx

RUN npm install -g yarn

WORKDIR /app

ENV RAILS_ENV=production
ENV BUNDLE_WITHOUT="development test"

RUN gem install bundler -v 2.5.23

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

RUN SECRET_KEY_BASE=dummy bin/rails assets:precompile

EXPOSE 3000

CMD ["bash", "-c", "bundle exec rails server -b 0.0.0.0 -p 3000"]