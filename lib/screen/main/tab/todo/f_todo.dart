import 'package:flutter/material.dart';
import 'package:state_manage_todo_app/common/common.dart';
import 'package:state_manage_todo_app/common/dart/extension/color_extension.dart';

import 'w_todo_list.dart';

class TodoFragment extends StatefulWidget {
  const TodoFragment({super.key});

  @override
  State<TodoFragment> createState() => _TodoFragmentState();
}

class _TodoFragmentState extends State<TodoFragment> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.appColors.seedColor.getSwatchByBrightness(100),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () => Scaffold.of(context).openDrawer(),
                icon: const Icon(Icons.menu),
              )
            ],
          ),
          Expanded(child: const TodoList().pSymmetric(h: 15)),
        ],
      ),
    );
  }
}