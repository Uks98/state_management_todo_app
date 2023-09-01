import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:state_manage_todo_app/common/common.dart';

import '../../../../common/data/memory/vo_todo.dart';
import '../../../../common/widget/w_rounded_container.dart';


class TodoItem extends StatelessWidget {
  final Todo todo;

  const TodoItem(this.todo, {super.key});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: (direction){
        context.holder.removeTodo(todo);
      },
      background: RoundedContainer(
        color: context.appColors.removeTodoBg,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Width(20),
            Icon(
              EvaIcons.trash2Outline,
              color: Colors.white,
            ),
          ],
        ),
      ),
      secondaryBackground: RoundedContainer(
        color: context.appColors.removeTodoBg,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              EvaIcons.trash2Outline,
              color: Colors.white,
            ),
            Width(20),
          ],
        ),
      ),
      key: ValueKey(todo.id),
      child: RoundedContainer(
          margin: const EdgeInsets.only(bottom: 6),
          color: context.appColors.itemBackground,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              todo.dueDate.relativeDays.text.make(),
              Row(
                children: [
                  TodoStatusWidget(todo),
                  Expanded(child: todo.title.text.size(20).medium.make()),
                  IconButton(
                      onPressed: () async {
                        context.holder.editTodo(todo);
                      },
                      icon: const Icon(EvaIcons.editOutline))
                ],
              )
            ],
          ).pOnly(top: 15, right: 15, left: 5, bottom: 10)),
    );
  }
}