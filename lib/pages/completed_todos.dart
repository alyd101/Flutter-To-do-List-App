import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/components/todo_tile.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/providers/todo_provider.dart';

class CompletedTodosPage extends StatelessWidget {
  const CompletedTodosPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodoProvider>(context);
    final List<Todo> completedTodos = provider.completedTodos;

    return Visibility(
      replacement: const Center(
        child: Text("You have not completed any tasks"),
      ),
      visible: completedTodos.isNotEmpty,
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("${completedTodos.length} Completed"),
          const Divider(),
          const Padding(padding: EdgeInsets.only(bottom: 10)),
          Expanded(
            child: ListView.builder(
              itemCount: completedTodos.length,
              itemBuilder: (context, index) => TodoTile(
                todo: completedTodos[index],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
