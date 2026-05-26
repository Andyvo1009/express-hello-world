# Use official Node.js LTS image
FROM node:20-alpine
 
# Set working directory
WORKDIR /app
 
# Copy package files
COPY package.json yarn.lock ./
 
# Install dependencies
RUN yarn install --frozen-lockfile --production
 
# Copy application source
COPY . .
 
# Expose the port the app listens on
EXPOSE 3000
 
# Start the application
CMD ["node", "app.js"]
 