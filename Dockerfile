# Use official Node.js image
FROM node:20.18-alpine

# Update OS packages for better security
RUN apk update && apk upgrade --no-cache

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package files first (for npm ci caching)
COPY package*.json ./

# Install production dependencies
RUN npm ci --only=production

# Copy the rest of the application code
COPY . .

# Expose the port the app listens on
EXPOSE 3000

# Command to start the app
CMD [ "node", "app.js" ]
