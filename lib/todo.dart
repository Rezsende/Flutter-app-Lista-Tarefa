import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:todoapp/constantes/color.dart';
import 'package:todoapp/models/todoModel.dart';

class TodoItem extends StatelessWidget {
  final TodoModel todo;
  final ontodoselet;
  final ondelete;
  const TodoItem(
      {super.key,
      required this.todo,
      required this.ondelete,
      required this.ontodoselet});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 17),
      child: ListTile(
        onTap: () {
          ontodoselet(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: whiteC,
        leading: Icon(
          todo.isdone ? Icons.check_box : Icons.check_box_outline_blank,
          color: pupleC,
        ),
        title: Text(
          todo.todotext!,
          style: TextStyle(
              fontSize: 16,
              color: blackC,
              decoration: todo.isdone ? TextDecoration.lineThrough : null),
        ),
        trailing: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical: 8),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: redC,
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            onPressed: () {
              ondelete(todo.id);
            },
            icon: Icon(Icons.delete),
            iconSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
