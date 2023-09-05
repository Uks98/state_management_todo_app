import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:state_manage_todo_app/common/data/memory/todo_data_notifier.dart';
import 'package:state_manage_todo_app/common/data/memory/vo_todo.dart';
import 'package:state_manage_todo_app/common/data/memory/vo_todo_status.dart';
import 'package:state_manage_todo_app/screen/dialog/d_confirm.dart';

import '../../../screen/main/write/d_write_todo.dart';

class TodoDataHolder extends GetxController{
  final RxList<Todo> notifier = <Todo>[].obs;
  //  const TodoDataHolder({super.key, required super.child,required this.notifier});
  //
  // @override
  // bool updateShouldNotify(covariant InheritedWidget oldWidget) {
  //  return true;
  // }
  //
  // static TodoDataHolder _of(BuildContext context){
  //   TodoDataHolder inherited = (context.dependOnInheritedWidgetOfExactType<TodoDataHolder>())!;
  //   return inherited;
  // }

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
    notifier.refresh();
  }
  void addTodo()async{
    final result = await WriteTodoDialog().show();
    if(result != null){
      notifier.add(Todo(
        id: DateTime.now().microsecondsSinceEpoch,
        title: result.text,
        dueDate: result.dateTime,
      ));
    }
  }

  void editTodo(Todo todo) async{
    final result = await WriteTodoDialog(todoForEdit: todo).show();
    if(result != null){
      todo.title = result.text;
      todo.dueDate = result.dateTime;
      notifier.refresh();
    }
  }

  void removeTodo(Todo todo) {
    notifier.remove(todo);
    notifier.refresh();
  }
}



// extension TodoDataHolderContextExtention on BuildContext{
//   TodoDataHolder get holder => TodoDataHolder._of(this);
// }

mixin class TodoDataProvider{
  late final TodoDataHolder todoData = Get.find();
}