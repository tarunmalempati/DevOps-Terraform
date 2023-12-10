To build and run the multi-container app using Docker Compose, follow these steps:  

1. Create the directory structure and files:
2. Navigate to the project directory:
3. Run the Docker Compose command:  
   docker-compose up --build  
This command will create and start the containers for both services based on the configurations in the docker-compose.yml file.
4. Stopping the containers:  
   To stop the containers, use Ctrl + C in the terminal where docker-compose up is running. Alternatively, in a different terminal window in the same directory, you can run:  
   docker-compose down  
   This command will stop and remove the containers defined in the docker-compose.yml file.
   
   
