
import 'package:flutter/cupertino.dart';
import 'package:state_manage_todo_app/common/data/memory/vo_todo.dart';

class TodoDataNotifier extends ValueNotifier<List<Todo>>{
  TodoDataNotifier() : super([]); //처음에 빈 리스트 돌려줌

 void addTodo(Todo todo){
   value.add(todo);
   notifyListeners();
 }

}