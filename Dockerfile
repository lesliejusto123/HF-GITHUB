# Dockerfile

FROM node:22

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Configuration for OpenClaw provider
ENV OPENCLAW_CONFIG='{"provider": {"type": "gemini", "baseUrl": "https://generativelanguage.googleapis.com/v1beta/openai/"}}'

# Expose port and start
EXPOSE 3000
CMD [ "node", "index.js" ]