import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:state_manage_todo_app/common/common.dart';
import 'package:state_manage_todo_app/screen/main/tab/todo/w_todo_item.dart';


class TodoList extends ConsumerWidget {
  TodoList({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final todoList = ref.watch(todoDataProvider);
    return todoList.isEmpty? "할일을 작성해보세요".text.size(30).makeCentered() : Column(
        children: todoList.map((e) => TodoItem(e)).toList()
    );
  }
}
