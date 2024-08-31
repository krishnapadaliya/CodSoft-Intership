import 'package:flutter/material.dart';

import '../model/todo.dart';

class AddToDo extends StatefulWidget {
  final List<ToDo> todosList;

  const AddToDo({super.key, required this.todosList});

  @override
  State<AddToDo> createState() => _AddToDoState();
}

class _AddToDoState extends State<AddToDo> {
  final _todoController = TextEditingController();
  var formkey = GlobalKey<FormState>();

  void _addToDoItem(String toDo) {
    setState(() {
      widget.todosList.add(ToDo(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        todoText: _todoController.text,
      ));
    });
    _todoController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formkey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _todoController,
                decoration: const InputDecoration(
                  label: Text('Tasks title'),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                _addToDoItem(_todoController.text);
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            )
          ],
        ),
      ),
    );
  }
}
