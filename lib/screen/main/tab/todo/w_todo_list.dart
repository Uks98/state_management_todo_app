import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_manage_todo_app/common/common.dart';
import 'package:state_manage_todo_app/common/data/memory/bloc/todo_bloc_state.dart';
import 'package:state_manage_todo_app/screen/main/tab/todo/w_todo_item.dart';


class TodoList extends StatelessWidget{
  TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoCubit,TodoBlocState>(builder: (context,state){
      return state.todoList.isEmpty?"할일을 작성해보세요".text.size(30).makeCentered()
          :Column(
        children: state.todoList.map((e) => TodoItem(e)).toList(),
      );
    });
  }
}
