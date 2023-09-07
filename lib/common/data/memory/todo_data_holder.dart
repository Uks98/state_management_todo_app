import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:state_manage_todo_app/common/data/memory/todo_data_notifier.dart';
import 'package:state_manage_todo_app/common/data/memory/vo_todo.dart';
import 'package:state_manage_todo_app/common/data/memory/vo_todo_status.dart';
import 'package:state_manage_todo_app/screen/dialog/d_confirm.dart';

import '../../../screen/main/write/d_write_todo.dart';



final todoDataProvider = StateNotifierProvider<TodoDataHolder, List<Todo>>((ref) => TodoDataHolder());

class TodoDataHolder extends StateNotifier<List<Todo>>{
 // final RxList<Todo> notifier = <Todo>[].obs;

  TodoDataHolder(): super([]);

  void changeTodoStatus(Todo todo)async{
    switch(todo.status){
      case TodoStatus.incomplete:
        todo.status = TodoStatus.onGoing;
      case TodoStatus.onGoing:
        todo.status = TodoStatus.complete;
      case TodoStatus.complete:
        final result = await ConfirmDialog("정말로 처음 상태로 변경 하시겠어요?").show();
        result?.runIfSuccess((data) => todo.status = TodoStatus.incomplete);
    }
    state = List.of(state);
  }
  void addTodo()async{
    final result = await WriteTodoDialog().show();
    if(result != null){
      state.add(Todo(
        id: DateTime.now().microsecondsSinceEpoch,
        title: result.text,
        dueDate: result.dateTime,
      ));
      state = List.of(state);
    }
  }

  void editTodo(Todo todo) async{
    final result = await WriteTodoDialog(todoForEdit: todo).show();
    if(result != null){
      todo.title = result.text;
      todo.dueDate = result.dateTime;
      state = List.of(state);
    }
  }

  void removeTodo(Todo todo) {
    state.remove(todo);
    state = List.of(state);
  }

}

extension TodoListHolderProvider on WidgetRef{
  TodoDataHolder get readHolder => read(todoDataProvider.notifier);
}


// extension TodoDataHolderContextExtention on BuildContext{
//   TodoDataHolder get holder => TodoDataHolder._of(this);
// }

// mixin class TodoDataProvider{
//   late final TodoDataHolder todoData = Get.find();
// }