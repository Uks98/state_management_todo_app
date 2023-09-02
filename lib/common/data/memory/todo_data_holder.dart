import 'package:flutter/cupertino.dart';
import 'package:state_manage_todo_app/common/data/memory/todo_data_notifier.dart';

class TodoDataHolder extends InheritedWidget{
  final TodoDataNotifier notifier;

   const TodoDataHolder({super.key, required super.child,required this.notifier});

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
   return true;
  }

  static TodoDataHolder _of(BuildContext context){
    TodoDataHolder inherited = (context.dependOnInheritedWidgetOfExactType<TodoDataHolder>())!;
    return inherited;
  }
}

extension TodoDataHolderContextExtention on BuildContext{
  TodoDataHolder get holder => TodoDataHolder._of(this);
}