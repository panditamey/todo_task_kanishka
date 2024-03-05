import 'package:flutter/material.dart';
import 'package:kanishka_assignment_app/home.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:hive/hive.dart';
import 'model/todo.dart';
import 'model/todo_adapter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);

  Hive.registerAdapter(TodoAdapter());

  await Hive.openBox<Todo>('todos');

  runApp(const Home());
}
