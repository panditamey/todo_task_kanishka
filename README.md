
# Todo App - Flutter Intern Assignment

This is a simple Todo app built with Flutter, Provider and Hive, allowing users to create, edit, delete, and mark todos as completed.

## Getting Started

To run the app locally, follow these steps:

### Prerequisites

- Flutter SDK installed
- Android Studio / VS Code or any other IDE for Flutter development
- Xcode (for macOS users)
- Git installed for version control

### Installation

1. Clone the repository to your local machine:

```
git clone https://github.com/panditamey/todo_task_kanishka.git
```

2. Navigate to the project directory:

```
cd into folder
```

3. Install dependencies using Flutter:

```
flutter pub get
```

### Running the App

1. Connect a device/emulator to your machine or use Flutter's web support.

2. Run the app:

```
flutter run
```

## Features

- **Add Todo**: Users can add new todos with a title and due date.
- **Edit Todo**: Users can edit existing todos to modify the title or due date.
- **Delete Todo**: Users can delete todos they no longer need.
- **Mark Todo as Completed**: Users can mark todos as completed by toggling a checkbox.

## Source Code Overview

The app is organized into the following components:

- **Models**: Contains the data model for a Todo item (`Todo`) and its adapter (`TodoAdapter`) for serialization/deserialization.
- **Provider**: Implements the business logic and state management using a `ChangeNotifier` (`TodoProvider`).
- **Screens**: Contains the UI screens for adding (`AddTodoScreen`) and editing (`EditTodoScreen`) todos, as well as the main screen (`TodoApp`) displaying the todo list (`TodoList`).

