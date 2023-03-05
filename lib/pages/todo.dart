import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/providers/todo_provider.dart';

class TodoPage extends StatelessWidget {
  final Todo todo;
  const TodoPage({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodoProvider>(context);

    void closePage() {
      Navigator.of(context).pop();
    }

    Future<void> confirmDeletion() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          title: const Text("Delete task"),
          content: const Text("Are you sure you want to delete this task?"),
          actions: [
            InkWell(
              onTap: () {
                provider.toggleToBeDeleted(todo);
                closePage();
                closePage();
              },
              child: const Text("Yes"),
            ),
            const Padding(padding: EdgeInsets.only(right: 15)),
            InkWell(
              onTap: () {
                closePage();
              },
              child: const Text("No"),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
          leading: InkWell(
            onTap: () => closePage(),
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: InkWell(
                onTap: () {
                  confirmDeletion();
                },
                child: const Icon(
                  LineIcons.trash,
                  color: Colors.black,
                ),
              ),
            ),
          ]),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              todo.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            const Padding(padding: EdgeInsets.only(top: 8)),
            Visibility(
              visible: todo.description.isNotEmpty,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Text(todo.description),
              ),
            ),
            Row(
              children: [
                Visibility(
                  visible: todo.date.isNotEmpty,
                  child: RichText(
                    text: TextSpan(text: "On", children: [
                      TextSpan(
                          text:
                              " ${todo.date}${todo.time.isNotEmpty ? ". " : ""}",
                          style: const TextStyle(fontWeight: FontWeight.bold))
                    ]),
                  ),
                ),
                Visibility(
                  visible: todo.time.isNotEmpty,
                  child: RichText(
                    text: TextSpan(text: "At ", children: [
                      TextSpan(
                          text: todo.time,
                          style: const TextStyle(fontWeight: FontWeight.bold))
                    ]),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
