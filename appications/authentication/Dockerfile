FROM ruby:2.7.0-slim

RUN apt-get update -qq && apt-get install -y --no-install-recommends \
  build-essential libcurl4-openssl-dev ca-certificates gnupg2 apt-transport-https \
  curl libpq-dev git libxml2-dev && rm -rf /var/lib/apt/lists/*

# Set an environment variable where the Rails app is installed to inside of Docker image
ENV APP_ROOT /var/www/app
RUN mkdir -p $APP_ROOT

# Set working directory
WORKDIR $APP_ROOT

# Setting env up
ENV RACK_ENV='production'

# Adding gems
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock

RUN gem install bundler && \
  bundle config set --local without 'development test' && \
  bundle install --jobs 20 --retry 5

# Adding project files
COPY . .

EXPOSE 3000

CMD ["bundle", "exec", "puma", "-p", "3000"]
