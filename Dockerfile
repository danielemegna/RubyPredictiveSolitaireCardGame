#FROM debian:latest
FROM resin/rpi-raspbian

RUN apt-get update \
  && apt-get install -y ruby ruby-dev make \
  && gem install --no-ri --no-rdoc sinatra sinatra-contrib

WORKDIR /app
CMD ["ruby", "web.rb"]
