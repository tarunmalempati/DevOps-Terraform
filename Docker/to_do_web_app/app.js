const express = require('express');
const app = express();
const PORT = 8000;

app.use(express.urlencoded({ extended: true }));
app.use(express.static('public'));

let todoItems = [];

app.get('/todos', (req, res) => {
    res.json(todoItems);
});

app.post('/todos', (req, res) => {
    const { task } = req.body;
    if (task && task.trim() !== '') {
        todoItems.push({ id: Date.now(), task });
        res.status(201).json({ message: 'Task added successfully' });
    } else {
        res.status(400).json({ error: 'Invalid task' });
    }
});
app.delete('/todos/:id', (req, res) => {
    const { id } = req.params;
    todoItems = todoItems.filter(item => item.id !== parseInt(id));
    res.json({ message: 'Task deleted successfully' });
});

app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
});
