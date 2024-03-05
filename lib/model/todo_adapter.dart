import 'package:hive/hive.dart';

import 'todo.dart';

class TodoAdapter extends TypeAdapter<Todo> {
  @override
  final int typeId = 0;

  @override
  Todo read(BinaryReader reader) {
    return Todo(
      title: reader.readString(),
      dueDate: DateTime.parse(reader.readString()),
      completed: reader.readBool(),
    );
  }

  @override
  void write(BinaryWriter writer, Todo obj) {
    writer.writeString(obj.title);
    writer.writeString(obj.dueDate.toIso8601String());
    writer.writeBool(obj.completed);
  }
}
