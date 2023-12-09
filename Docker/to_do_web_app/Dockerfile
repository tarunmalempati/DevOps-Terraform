# Use a base image with Node.js pre-installed
FROM node:14

# Set working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to work directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy all source code to the container
COPY . .

# Expose the port your app runs on
EXPOSE 8000

# Define the start command to run your application
CMD ["npm", "start"]
