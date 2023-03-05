import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/components/add_category_modal_bottom_sheet.dart';
import 'package:todo_app/components/delete_button.dart';
import 'package:todo_app/providers/todo_provider.dart';

class CategoryBox extends StatefulWidget {
  const CategoryBox({super.key});

  @override
  State<CategoryBox> createState() => _CategoryBoxState();
}

class _CategoryBoxState extends State<CategoryBox> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodoProvider>(context);
    var categories = provider.categories;
    String selectedCategory = "";
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            onPressed: () => Navigator.pop(context, selectedCategory),
            icon: const Icon(LineIcons.backspace, color: Colors.black)),
        title: const Text(
          "Categories",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30, color: Colors.black),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showModalBottomSheet(
            context: context,
            builder: (context) =>
                Wrap(children: [AddCategoryModalBottomSheet()]),
          ).then((value) => provider.addCategory(value));
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(LineIcons.plus),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          Expanded(
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) => Row(
                children: [
                  Text(
                    categories[index],
                    style: const TextStyle(fontSize: 13),
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                        selectedCategory = categories[index];
                        Navigator.pop(context, selectedCategory);
                      },
                      icon: const Icon(LineIcons.plus, size: 20)),
                  DeleteButton(
                    onTap: () => provider.removeCategory(categories[index]),
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
