import 'package:hive/hive.dart';

class Todo {
  final String title;
  final DateTime dueDate;
  bool completed;

  Todo({
    required this.title,
    required this.dueDate,
    this.completed = false,
  });

  void save() {
    final box = Hive.box<Todo>('todos');
    box.put(box.keyAt(box.values.toList().indexOf(this)), this);
  }
}
