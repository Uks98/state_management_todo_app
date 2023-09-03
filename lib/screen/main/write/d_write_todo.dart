import 'package:flutter/material.dart';
import 'package:nav/dialog/dialog.dart';
import 'package:state_manage_todo_app/common/common.dart';
import 'package:state_manage_todo_app/common/dart/extension/datetime_extension.dart';
import 'package:state_manage_todo_app/common/util/app_keyboard_util.dart';
import 'package:state_manage_todo_app/common/widget/constant_widget.dart';
import 'package:state_manage_todo_app/common/widget/scaffold/bottom_dialog_scaffold.dart';
import 'package:state_manage_todo_app/common/widget/w_round_button.dart';
import 'package:after_layout/after_layout.dart';
import 'package:state_manage_todo_app/screen/main/write/vo_write_todo_result.dart';
import '../../../common/data/memory/vo_todo.dart';
import '../../../common/widget/w_rounded_container.dart';

//최종적으로 넘겨주고 싶은 타입 제네릭으로 표시
class WriteTodoDialog extends DialogWidget<WriteTodoResult> {

  final Todo? todoForEdit;
   WriteTodoDialog({super.key,this.todoForEdit});

  @override
  DialogState<WriteTodoDialog> createState() => _WriteTodoDialogState();
}

class _WriteTodoDialogState extends DialogState<WriteTodoDialog> with AfterLayoutMixin{
  DateTime _seletedDate = DateTime.now();
  final textController = TextEditingController();
  final node = FocusNode();

  @override
  void initState() {
    super.initState();
    if(widget.todoForEdit != null){
      _seletedDate = widget.todoForEdit!.dueDate;
      textController.text = widget.todoForEdit!.title;
    }
  }
  @override
  Widget build(BuildContext context) {
    return BottomDialogScaffold(body: RoundedContainer(
      color: context.backgroundColor,
      child: Column(
        children: [
          Row(children: [
            "할 일을 작성해주세요".text.size(18).bold.make(),
            spacer,
            _seletedDate.formattedDate.text.make(),
            IconButton(onPressed: _selectDate, icon: Icon(Icons.calendar_month))
          ],),
          height20,
          Row(
            children: [
              Expanded(child: TextField(
                focusNode: node,
                controller: textController,

              )),
              RoundButton(text: isEditMode ? "수정" : "추가", onTap: (){
                widget.hide(WriteTodoResult(_seletedDate, textController.text));

              })
            ],
          )
        ],
      ),
    ));

  }

  bool get isEditMode => widget.todoForEdit != null;
  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    AppKeyboardUtil.show(context, node);
    throw UnimplementedError();
  }
  void _selectDate()async{
    final date = await showDatePicker(context: context, initialDate: _seletedDate, firstDate: DateTime.now().subtract(Duration(days: 365)), lastDate: DateTime.now().add(Duration(days: 365 * 10)));
    if(date!=null){
      setState(() {
        _seletedDate = date;
      });
    }
  }
}

