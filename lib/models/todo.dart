class Todo {
  String category = "";
  String description = "";
  String title;
  String date;
  String time;
  bool isComplete = false;
  bool toBeDeleted = false;

  Todo(
      {required this.title,
      required this.date,
      required this.description,
      required this.time,
      required this.category});
}
