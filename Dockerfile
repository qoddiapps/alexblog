# Use the official Node.js 18 image as the base image
FROM node:18-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application files
COPY . .

# Build the site with Eleventy
RUN npx @11ty/eleventy

# Install a simple static file server (serve)
RUN npm install -g serve

# Expose port 8080
EXPOSE 8080

# Command to serve the built site
CMD ["serve", "_site", "-l", "8080"]
