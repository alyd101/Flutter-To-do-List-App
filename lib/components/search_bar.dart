import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:todo_app/pages/search_results.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.only(left: 8, bottom: 8),
          child: TextField(
            controller: controller,
            textInputAction: TextInputAction.search,
            onSubmitted: (value) {
              controller.clear();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchResultsPage(task: value.trim()),
                ),
              );
            },
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: "Search tasks",
              prefixIcon: Icon(
                LineIcons.search,
                size: 20,
              ),
            ),
            style: const TextStyle(fontSize: 12),
          ),
        ),
      ),
    );
  }
}
