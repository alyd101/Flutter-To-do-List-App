import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/body.dart';
import 'package:todo_app/providers/todo_provider.dart';
import 'package:todo_app/theme.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TodoProvider(),
      builder: (context, child) => const TodoList(),
    ),
  );
}

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      home: const DefaultTabController(
        length: 3,
        child: Body(),
      )
    );
  }
}
