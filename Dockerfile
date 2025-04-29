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

# Build the project
RUN npm run build

# Expose port 80
EXPOSE 80

# Start the static server to serve the generated _site folder
CMD ["npx", "serve", "-s", "_site", "-l", "80"]
