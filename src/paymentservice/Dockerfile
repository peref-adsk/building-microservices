FROM ruby:3.0

WORKDIR /usr/src/app/
COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

EXPOSE 3333


CMD ["ruby", "/usr/src/app/payment.rb"]
