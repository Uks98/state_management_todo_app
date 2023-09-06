import 'package:freezed_annotation/freezed_annotation.dart';

import '../vo_todo.dart';
import 'bloc_status.dart';

part 'todo_bloc_state.freezed.dart';
@freezed
class TodoBlocState with _$TodoBlocState{
  const factory TodoBlocState(
   BlocStatus status,
   List<Todo> todoList,
      )= _TodoBlocState;
}