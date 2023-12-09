1. Initialize Node.js Project:  
   npm init -y  
2. Install Required Packages:  
   npm install express  
3. Create Backend:  
   Create a file named app.js for the backend  
4. Create Frontend:  
   Create a directory named public and inside it, create index.html, styles.css and scripts.js files.  
  
Here's an example of how to modify your package.json file to include the start script:  
  
{  
  "name": "todo-app",  
  "version": "1.0.0",  
  "description": "Simple To-Do Web Application",  
  "main": "app.js",  
  "scripts": {  
    "start": "node app.js"  
  },  
  "dependencies": {  
    "express": "^4.17.2"  
  }  
}  
