import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/providers/todo_provider.dart';
import 'package:todo_app/components/todo_tile.dart';

class DeletedTodosPage extends StatelessWidget {
  const DeletedTodosPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodoProvider>(context);
    final List<Todo> deletedTodos = provider.deletedTodos;

    return Visibility(
      replacement:
          const Center(child: Text("You have not deleted any tasks")),
      visible: deletedTodos.isNotEmpty,
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(children: [
          Expanded(
            child: ListView.builder(
              itemCount: deletedTodos.length,
              itemBuilder: (context, index) => TodoTile(
                todo: deletedTodos[index],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
