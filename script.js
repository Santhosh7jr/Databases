const STORAGE_KEY = "daymark-tasks";

const state = {
  tasks: loadTasks(),
  filter: "all"
};

const taskList = document.querySelector("#task-list");
const emptyState = document.querySelector("#empty-state");
const emptyTitle = document.querySelector("#empty-title");
const emptyHint = document.querySelector("#empty-hint");
const taskCount = document.querySelector("#task-count");
const taskInput = document.querySelector("#task-input");
const progressMessage = document.querySelector("#progress-message");

function loadTasks() {
  try {
    const saved = JSON.parse(localStorage.getItem(STORAGE_KEY));
    return Array.isArray(saved) ? saved.filter((task) => task && typeof task.text === "string") : [];
  } catch {
    return [];
  }
}

function saveTasks() {
  localStorage.setItem(STORAGE_KEY, JSON.stringify(state.tasks));
}

function renderDate() {
  const today = new Date();
  document.querySelector("#day-name").textContent = today.toLocaleDateString(undefined, { weekday: "short" });
  document.querySelector("#date-number").textContent = today.getDate();
  document.querySelector("#month-name").textContent = today.toLocaleDateString(undefined, { month: "short" });
}

function visibleTasks() {
  if (state.filter === "active") return state.tasks.filter((task) => !task.completed);
  if (state.filter === "completed") return state.tasks.filter((task) => task.completed);
  return state.tasks;
}

function render() {
  const activeCount = state.tasks.filter((task) => !task.completed).length;
  const tasks = visibleTasks();
  taskCount.textContent = activeCount;
  taskList.replaceChildren(...tasks.map(createTaskElement));

  const isEmpty = tasks.length === 0;
  emptyState.hidden = !isEmpty;
  if (state.filter === "completed") {
    emptyTitle.textContent = "No completed tasks.";
    emptyHint.textContent = "Complete a task and it will appear here.";
  } else if (state.filter === "active") {
    emptyTitle.textContent = "All clear.";
    emptyHint.textContent = "You have finished everything on your list.";
  } else {
    emptyTitle.textContent = "Nothing here yet.";
    emptyHint.textContent = "Add a task above to get started.";
  }

  progressMessage.textContent = activeCount === 0 && state.tasks.length > 0
    ? "Everything on your list is complete."
    : activeCount === 1 ? "One thing at a time." : "A little progress every day.";
}

function createTaskElement(task) {
  const item = document.createElement("li");
  item.className = `task-item${task.completed ? " is-complete" : ""}`;
  item.dataset.id = task.id;

  const toggle = document.createElement("button");
  toggle.className = "task-toggle";
  toggle.type = "button";
  toggle.setAttribute("aria-label", task.completed ? `Mark "${task.text}" as active` : `Complete "${task.text}"`);
  toggle.textContent = task.completed ? "✓" : "";
  toggle.addEventListener("click", () => {
    task.completed = !task.completed;
    saveTasks();
    render();
  });

  const text = document.createElement("span");
  text.className = "task-text";
  text.textContent = task.text;

  const remove = document.createElement("button");
  remove.className = "delete-task";
  remove.type = "button";
  remove.setAttribute("aria-label", `Delete "${task.text}"`);
  remove.textContent = "×";
  remove.addEventListener("click", () => {
    state.tasks = state.tasks.filter((entry) => entry.id !== task.id);
    saveTasks();
    render();
  });

  item.append(toggle, text, remove);
  return item;
}

document.querySelector("#add-form").addEventListener("submit", (event) => {
  event.preventDefault();
  const text = taskInput.value.trim();
  if (!text) {
    taskInput.focus();
    return;
  }
  state.tasks.unshift({ id: crypto.randomUUID(), text, completed: false });
  saveTasks();
  taskInput.value = "";
  state.filter = "all";
  document.querySelectorAll(".filter").forEach((button) => button.classList.toggle("is-active", button.dataset.filter === "all"));
  render();
  taskInput.focus();
});

document.querySelectorAll(".filter").forEach((button) => {
  button.addEventListener("click", () => {
    state.filter = button.dataset.filter;
    document.querySelectorAll(".filter").forEach((entry) => entry.classList.toggle("is-active", entry === button));
    render();
  });
});

document.querySelector("#clear-completed").addEventListener("click", () => {
  state.tasks = state.tasks.filter((task) => !task.completed);
  saveTasks();
  render();
});

renderDate();
render();
