import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/components/todo_tile.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/providers/todo_provider.dart';

class SearchResultsPage extends StatelessWidget {
  final String task;
  const SearchResultsPage({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodoProvider>(context);
    List<Todo> searchResults = provider.getSearchResults(task);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: RichText(
          text: TextSpan(
            text: "Showing search results for: ",
            children: [
              TextSpan(
                text: task,
                style: const TextStyle(fontWeight: FontWeight.bold),
              )
            ],
            style: const TextStyle(fontSize: 14, color: Colors.black),
          ),
        ),
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(
            LineIcons.backspace,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Visibility(
              replacement: const Center(
                child: Text("0 items found"),
              ),
              visible: searchResults.isNotEmpty,
              child: Expanded(
                child: ListView.builder(
                  itemCount: searchResults.length,
                  itemBuilder: (context, index) =>
                      TodoTile(todo: searchResults[index]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
