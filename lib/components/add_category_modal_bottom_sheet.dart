import 'package:flutter/material.dart';

class AddCategoryModalBottomSheet extends StatelessWidget {
  const AddCategoryModalBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                  hintText: "Category", hintStyle: TextStyle(fontSize: 12)),
              style: const TextStyle(fontSize: 12),
            ),
          ),
          MaterialButton(
            color: Theme.of(context).primaryColor,
            onPressed: () {
              Navigator.pop(context, controller.text);
            },
            child: const Text("Add", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
