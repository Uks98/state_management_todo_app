import 'package:flutter/material.dart';
import 'package:state_manage_todo_app/common/common.dart';
import '../../../../common/data/memory/vo_todo.dart';
import '../../../../common/data/memory/vo_todo_status.dart';


class TodoStatusWidget extends StatelessWidget {
  final Todo todo;


  TodoStatusWidget(this.todo, {super.key});

  @override
  Widget build(BuildContext context) {
    return Tap(
      onTap: () {
        context.readTodoCubit.changeTodoStatus(todo);
       // todoData.changeTodoStatus(todo);
      },
      child: SizedBox(
          width: 50,
          height: 50,
          child: switch (todo.status) {
            TodoStatus.complete => Checkbox(
              value: true,
              onChanged: null,
              fillColor: MaterialStateProperty.all(
                context.appColors.checkBoxColor,
              ),
            ),
            TodoStatus.incomplete => const Checkbox(
              value: false,
              onChanged: null,
            ),
            TodoStatus.onGoing =>  Container(color:Colors.orange,)
          }),
    );
  }
}