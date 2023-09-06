import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:state_manage_todo_app/common/data/memory/bloc/bloc_status.dart';
import 'package:state_manage_todo_app/common/data/memory/bloc/todo_bloc_state.dart';
import 'package:state_manage_todo_app/common/data/memory/vo_todo.dart';
import 'package:state_manage_todo_app/common/data/memory/vo_todo_status.dart';
import 'package:state_manage_todo_app/screen/dialog/d_confirm.dart';

import '../../../screen/main/write/d_write_todo.dart';

class TodoCubit extends Cubit<TodoBlocState>{

  TodoCubit() : super(const TodoBlocState(BlocStatus.initial, <Todo>[]));
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
  void addTodo()async{
    final result = await WriteTodoDialog().show();
    if(result != null){
      final copiedOldTodoList = List.of(state.todoList);
      copiedOldTodoList.add(Todo(
        id: DateTime.now().microsecondsSinceEpoch,
        title: result.text,
        dueDate: result.dateTime, createdTime: DateTime.now(),
        status: TodoStatus.incomplete
      ));
      emit(state.copyWith(todoList: copiedOldTodoList));
    }
  }


  void changeTodoStatus(Todo todo)async{
    final copiedOldTodoList = List.of(state.todoList);
    final todoIndex = copiedOldTodoList.indexWhere((element) => element.id == todo.id );
    TodoStatus status = todo.status;
    switch(todo.status){
      case TodoStatus.incomplete:
        status= TodoStatus.onGoing;
      case TodoStatus.onGoing:
        status = TodoStatus.complete;
      case TodoStatus.complete:
        final result = await ConfirmDialog("정말로 처음 상태로 변경 하시겠어요?").show();
        result?.runIfSuccess((data) => status = TodoStatus.incomplete);
    }
    copiedOldTodoList[todoIndex] = todo.copyWith(status: status);
    emitNewList(copiedOldTodoList);
  }


  void editTodo(Todo todo) async{
    final result = await WriteTodoDialog(todoForEdit: todo).show();
    if(result != null){
      final oldCopiedList = List<Todo>.from(state.todoList);
      oldCopiedList[oldCopiedList.indexOf(todo)] = todo.copyWith(title: result.text,dueDate: result.dateTime,modifyTime: DateTime.now());
      emitNewList(oldCopiedList);
    }
  }

  void emitNewList(List<Todo> oldCopiedList) => emit(state.copyWith(todoList: oldCopiedList));

  void removeTodo(Todo todo) {
    final oldCopiedList = List<Todo>.from(state.todoList);
    oldCopiedList.removeWhere((element) => element.id == todo.id);
    emitNewList(oldCopiedList);
  }
}



// extension TodoDataHolderContextExtention on BuildContext{
//   TodoDataHolder get holder => TodoDataHolder._of(this);
// }

// mixin class TodoDataProvider{
//   late final TodoCubit todoData = Get.find();
// }