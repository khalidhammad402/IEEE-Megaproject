import 'package:flutter/material.dart';
import 'package:to_do_list_obliviate/screens/todo.dart';

import 'package:to_do_list_obliviate/screens/new_todo_dialog.dart';
import 'package:to_do_list_obliviate/screens/todo_list.dart';

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  List<Todo> todos = [];

  _toggleTodo(Todo todo, bool isChecked) {
    setState(() {
      todo.isDone = isChecked;
    });
  }

  _addTodo() async {
    final todo = await showDialog<Todo>(
      context: context,
      builder: (BuildContext context) {
        return NewTodoDialog();
      },
    );

    if (todo != null) {
      setState(() {
        todos.add(todo);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
          title: const Text(
              'Todo List',
          style: TextStyle(
            fontFamily: 'DancingScript',
            fontSize: 30,
          ),)),
      body: TodoList(
        todos: todos,
        onTodoToggle: _toggleTodo,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        child: const Icon(
            Icons.add,
        ),
        onPressed: _addTodo,
      ),
    );
  }
}
