import 'package:flutter/cupertino.dart';
import 'package:state_manage_todo_app/common/common.dart';


class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: context.holder.notifier,
        builder: (context,todoList,child){
          return todoList.isEmpty? "할일을 작성해보세요".text.size(30).makeCentered() : Column(
            children: todoList.map((e) => e.title.text.make()).toList(),
          );
        });
  }
}
