# Stage 1: Set up the Node.js environment
FROM node:latest AS build
WORKDIR /app

# Copy package.json and package-lock.json to install dependencies
COPY package*.json ./
RUN npm install

# Copy the application code
COPY . .

# Stage 2: Create a lightweight production image
FROM node:alpine
WORKDIR /app

# Copy only the necessary files from the previous stage
COPY --from=build /app .

# Expose port 3000 (or the port your Node.js application uses)
EXPOSE 3000

# Command to start the Node.js application
CMD ["npm", "start"]
