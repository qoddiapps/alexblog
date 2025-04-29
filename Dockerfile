# Use official Node.js LTS version as base image
FROM node:18

# Set working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to install dependencies
COPY package*.json ./

# Install project dependencies
RUN npm install

# Copy the rest of the application files
COPY . .

# Build the project if necessary (adjust command as needed)
RUN npm run build || echo "No build script, skipping"

# Expose port 3000 (adjust if your app listens on a different port)
EXPOSE 3000

# Start the application (adjust start script if needed)
CMD ["npm", "start"]
