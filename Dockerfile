# Use official Node.js LTS version as base image
FROM node:18

# Set working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to install dependencies
COPY package*.json ./

# Install dependencies including devDependencies
RUN npm install

# Copy the rest of the application files
COPY . .

# List files (debug)
RUN ls -la

# Set environment variable for Eleventy config
ENV ELEVENTY_CONFIG=.eleventy.js

# Build the project with explicit config
RUN npx eleventy --config .eleventy.js

# Expose port 80
EXPOSE 80

# Start the static server to serve the generated _site folder
CMD ["npx", "serve", "-s", "_site", "-l", "80"]
