import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_manage_todo_app/common/data/memory/vo_todo_status.dart';

part 'vo_todo.freezed.dart';

@freezed
class Todo with _$Todo {
  const factory Todo({
    required int id,
    required String title,
    required DateTime dueDate,
    DateTime? modifyTime,
    required DateTime createdTime,
    required TodoStatus status,
  }) = _Todo;
}
