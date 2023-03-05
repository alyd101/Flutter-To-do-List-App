import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/models/todo.dart';

class TodoProvider extends ChangeNotifier {
  String currentDate = DateFormat.yMMMd().format(DateTime.now());
  List<String> categories = ["Urgent", "Important", "Not Important"];

  //test data
  List<Todo> allTodos = [
    Todo(
        title: "Meet with Boss",
        date: "Feb 2, 2023",
        time: "8:00 AM",
        description: "Approval for new project",
        category: "Urgent"),
    Todo(
        title: "Pick up Joey from Basketball",
        date: "Jan 27, 2023",
        time: "3:00 PM",
        description: "",
        category: "Important"),
    Todo(
        title: "Breakfast Meeting",
        date: "Jan 30, 2023",
        time: "9:30 AM",
        description: "With department heads",
        category: "Urgent"),
    Todo(
        title: "Lunch at Zambino's with Greg",
        date: "Jan 28, 2023",
        time: "12:00 PM",
        description: "To discuss Exodus presentation",
        category: "Not Important"),
    Todo(
        title: "Cycle training",
        date: "Jan 27, 2023",
        time: "5:00 PM",
        description: "",
        category: "Not Important"),
    Todo(
        title: "Wash laundry",
        date: "Jan 28, 2023",
        time: "",
        description: "",
        category: "Important"),
    Todo(
        title: "Dinner with in-laws",
        date: "Jan 30, 2023",
        time: "5:00 PM",
        description: "",
        category: "Important"),
  ];

  List<Todo> get deletedTodos {
    return allTodos.where((element) => element.toBeDeleted).toList();
  }

  List<Todo> get completedTodos {
    return allTodos
        .where((element) => element.isComplete && !element.toBeDeleted)
        .toList();
  }

  void addTodo(String title, String description, String date, String time,
      String category) {
    allTodos.add(Todo(
        title: title,
        date: date,
        description: description,
        time: time,
        category: category));
    notifyListeners();
  }

  void toggleToBeDeleted(Todo todo) {
    todo.toBeDeleted = !todo.toBeDeleted;
    notifyListeners();
  }

  void toggleIsComplete(Todo todo) {
    todo.isComplete = !todo.isComplete;
    notifyListeners();
  }

  List<Todo> getSearchResults(String task) {
    return allTodos
        .where((element) =>
            RegExp(task, caseSensitive: false).hasMatch(element.title))
        .toList();
  }

  void addCategory(String category) {
    categories.add(category);
    notifyListeners();
  }

  void removeCategory(String category) {
    categories.remove(category);
    notifyListeners();
  }
}
