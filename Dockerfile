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

# Expose port 80
EXPOSE 80

# Start the application with npm run serve
CMD ["npm", "run", "serve"]
