# Updated Dockerfile

# Base image
FROM ruby:2.7

# Set environment variables
ENV BUNDLE_PATH=/usr/local/bundle
ENV BUNDLE_APP_CONFIG=/usr/local/bundle

# Set working directory
WORKDIR /app

# Copy Gemfile and install dependencies
COPY Gemfile Gemfile.lock ./ 
RUN bundle install

# Copy application code
COPY . .

# Fix the missing baseUrl for the gemini provider in OpenClaw configuration
ENV OPENCLAW_CONFIG='{"baseUrl": "https://generativelanguage.googleapis.com/v1beta/openai/"}'

CMD ["your-start-command"] 
