import 'package:state_manage_todo_app/common/data/memory/vo_todo_status.dart';

class Todo{
  Todo({required this.id,required this.title,required this.dueDate,
  this.status = TodoStatus.incomplete
  }):createdTime = DateTime.now();

  int id;
  String title;
  final DateTime createdTime;
  DateTime? modifyTime;
  DateTime dueDate;
  TodoStatus status;
}