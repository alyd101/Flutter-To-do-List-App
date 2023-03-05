import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/pages/todo.dart';
import 'package:todo_app/providers/todo_provider.dart';

class TodoTile extends StatefulWidget {
  final Todo todo;
  const TodoTile({super.key, required this.todo});

  @override
  State<TodoTile> createState() => _TodoTileState();
}

class _TodoTileState extends State<TodoTile> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodoProvider>(context);
    final todo = widget.todo;

    return SizedBox(
      height: 90,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            InkWell(
              onTap: () => provider.toggleIsComplete(todo),
              child: Icon(
                todo.isComplete ? LineIcons.checkCircle : LineIcons.circle,
                size: 25,
              ),
            ),
            const Padding(padding: EdgeInsets.only(right: 5)),
            Expanded(
              child: InkWell(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => TodoPage(todo: todo)),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 3, bottom: 10),
                        child: Text(
                          todo.title,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                      ),
                      Row(children: [
                        Visibility(
                          visible: todo.date != provider.currentDate,
                          child: Text(
                            widget.todo.date
                                    .contains(DateTime.now().year.toString())
                                ? todo.date.replaceAll(
                                    RegExp(", ${DateTime.now().year}"),
                                    todo.time.isNotEmpty ? ", " : "")
                                : todo.date,
                            style: const TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Text(
                          todo.time,
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ]),
                    ]),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [ 
                InkWell(
                    onTap: () => provider.toggleToBeDeleted(todo),
                    child: todo.toBeDeleted
                        ? const Text("restore")
                        : const Text(""),
                  ),
                  const Spacer(),
                  Text(
                    todo.category,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                
              ],
            )
          ]),
        ),
      ),
    );
  }
}
