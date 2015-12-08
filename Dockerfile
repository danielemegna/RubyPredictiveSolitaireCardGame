FROM debian:latest

RUN apt-get update \
  && apt-get install -y ruby ruby-dev make \
  && gem install puma sinatra sinatra-contrib

WORKDIR /app
CMD ["ruby", "web.rb"]
