import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../model/todo.dart';

class TodoProvider extends ChangeNotifier {
  List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  Future<void> loadTodos() async {
    final todosBox = await Hive.openBox<Todo>('todos');
    _todos = todosBox.values.toList();
    notifyListeners();
  }

  Future<void> addTodo(Todo newTodo) async {
    final todosBox = await Hive.openBox<Todo>('todos');
    todosBox.add(newTodo);
    _todos.add(newTodo);
    notifyListeners();
  }

  Future<void> toggleTodoCompletion(int index) async {
    final todo = _todos[index];
    todo.completed = !todo.completed;
    todo.save(); 
    notifyListeners();
  }

  Future<void> deleteTodo(int index) async {
    final todosBox = await Hive.openBox<Todo>('todos');
    todosBox.deleteAt(index);
    _todos.removeAt(index);
    notifyListeners();
  }

  Future<void> editTodo(Todo oldTodo, Todo newTodo) async {
    final todosBox = await Hive.openBox<Todo>('todos');
    final index = _todos.indexOf(oldTodo);
    _todos[index] = newTodo;
    todosBox.putAt(index, newTodo);
    notifyListeners();
  }
}
