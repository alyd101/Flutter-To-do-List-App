import 'package:flutter/material.dart';

class DeleteButton extends StatelessWidget {
  final Function onTap;
  const DeleteButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>onTap(),
      child: const Text(
        "X",
        style: TextStyle(
            color: Colors.red, fontSize: 10, fontWeight: FontWeight.bold),
      ),
    );
  }
}
