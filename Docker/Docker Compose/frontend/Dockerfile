# Use a Node.js base image
FROM node:latest

# Set working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the frontend files to the container
COPY . .

# Set environment variables if needed
# ENV ENV_VARIABLE value

# Expose the port the app runs on
EXPOSE 8000

# Command to start the application
CMD ["npm", "start"]
