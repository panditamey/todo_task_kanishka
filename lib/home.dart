import 'package:flutter/material.dart';
import 'package:kanishka_assignment_app/constants/strings.dart';
import 'package:provider/provider.dart';
import 'provider/todo_provider.dart';
import 'screens/todo_app.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoProvider(),
      child: const MaterialApp(
        title: appName,
        home: TodoApp(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
