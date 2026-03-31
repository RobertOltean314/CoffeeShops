FROM ruby:3.2.0
WORKDIR /app

RUN apt-get update && apt-get install -y nodejs npm postgresql-client \
    && rm -rf /var/lib/apt/lists/*

COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install

COPY . .
EXPOSE 3000
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]