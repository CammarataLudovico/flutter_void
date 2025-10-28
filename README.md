# Project 2.1: A simple To-Do List
## A classic to-do list application. The main screen displays a list of tasks, and a "+" button navigates to a new screen where users can add a new task to the list.
### Core Technical Requirements:
- Use Navigator.push to move to an "Add Task" screen and Navigator.pop to return.
- Manage a List<String> or a list of custom Task objects in the main screen's state.
- Use ListView to dynamically display the list of tasks.
- Pass data (the new task) from the second screen back to the first.
### Bonus: add more functionalities
- Add a CheckboxListTile for each item.
- Tapping the checkbox should toggle a "completed" status, displayed with strikethrough text.
- Filter TODOs keeping only the done TODOs, use a button, place it wherever
- tip: implement a List<...> get _filtered that derives state
