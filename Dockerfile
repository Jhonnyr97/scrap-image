# Use an official Ruby runtime as the base image
FROM ruby:2.7

# Set the working directory
WORKDIR /app

# Copy the Gemfile and Gemfile.lock to the working directory
COPY Gemfile Gemfile.lock ./

# Install necessary dependencies and gems
RUN apt-get update && apt-get install -y build-essential
RUN bundle install

# Copy the application code to the working directory
COPY . .

RUN mkdir -p /app/shared/log /app/shared/pids /app/shared/sockets

# Expose the default Sinatra port
EXPOSE 3000

# Start the application
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]

