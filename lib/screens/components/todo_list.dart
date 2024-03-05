import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/todo_provider.dart';
import '../edit_todo_screen.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context);
    final todos = todoProvider.todos;

    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];
        return ListTile(
          title: Text(todo.title),
          subtitle: Text('Due Date: ${todo.dueDate.toString()}'),
          leading: Checkbox(
            value: todo.completed,
            onChanged: (value) {
              todoProvider.toggleTodoCompletion(index);
            },
            fillColor: MaterialStateProperty.all(Colors.blueAccent),
            checkColor: Colors.white,
            focusColor: Colors.white,
            hoverColor: Colors.white,
            activeColor: Colors.white,
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.edit),
                color: Colors.blueAccent,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditTodoScreen(todo: todo),
                    ),
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                color: Colors.red,
                onPressed: () {
                  todoProvider.deleteTodo(index);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
