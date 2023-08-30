import 'package:flutter/material.dart';
import 'package:to_do/model/todo.dart';

class ToDoBoxes extends StatelessWidget {
  final ToDo todo;
  final onToDoChanged;
  final onDeleteItem;
  const ToDoBoxes(
      {super.key, required this.todo, this.onToDoChanged, this.onDeleteItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: ListTile(
        onTap: () {
          onToDoChanged(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 20,
        ),
        tileColor: Colors.white,
        leading: Icon(
          todo.isDone
              ? Icons.check_box_rounded
              : Icons.check_box_outline_blank_rounded,
          color: Colors.blue,
        ),
        title: Text(
          todo.toDoText!,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
            decoration: todo.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Container(
          padding: const EdgeInsets.all(0),
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(7),
          ),
          child: IconButton(
              onPressed: () {
                onDeleteItem(todo.id);
              },
              icon: const Icon(
                Icons.delete_rounded,
                color: Colors.white,
              )),
        ),
      ),
    );
  }
}
