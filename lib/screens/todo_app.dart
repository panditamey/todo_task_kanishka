import 'package:flutter/material.dart';
import 'package:kanishka_assignment_app/constants/strings.dart';
import 'package:provider/provider.dart';

import '../provider/todo_provider.dart';
import 'add_todo_screen.dart';
import 'components/todo_list.dart';

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  bool _isInitialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInitialized) {
      final todoProvider = Provider.of<TodoProvider>(context);
      todoProvider.loadTodos();
      _isInitialized = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          appName,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddTodoScreen()),
              );
            },
          ),
        ],
      ),
      body: TodoList(),
    );
  }
}
