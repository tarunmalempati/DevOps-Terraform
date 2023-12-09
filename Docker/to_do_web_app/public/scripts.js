async function addTask() {
    const taskInput = document.getElementById('taskInput');
    const task = taskInput.value.trim();
    if (task !== '') {
        const response = await fetch('/todos', {
            method: 'POST',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            body: `task=${encodeURIComponent(task)}`
        });
        if (response.ok) {
            taskInput.value = '';
            loadTasks();
        } else {
            console.error('Failed to add task');
        }
    }
}
async function deleteTask(id) {
    const response = await fetch(`/todos/${id}`, {
        method: 'DELETE'
    });
    if (response.ok) {
        loadTasks();
    } else {
        console.error('Failed to delete task');
    }
}

async function loadTasks() {
    const taskList = document.getElementById('taskList');
    taskList.innerHTML = '';
    const response = await fetch('/todos');
    const tasks = await response.json();
    tasks.forEach(task => {
        const li = document.createElement('li');
        li.innerHTML = `
            ${task.task}
            <button onclick="deleteTask(${task.id})">Delete</button>
        `;
        taskList.appendChild(li);
    });
}

window.onload = loadTasks;

