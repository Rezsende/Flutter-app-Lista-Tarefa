class TodoModel {
  String? id;
  String? todotext;
  bool isdone;

  TodoModel({required this.id, required this.todotext, this.isdone = false});

  static List<TodoModel> todolist() {
    return [
      TodoModel(
          id: "4",
          todotext: "Estuda Machine Learning 8:00 as 12:00",
          isdone: true),
      TodoModel(id: "1", todotext: "Estuda Dart 13:00 as 14:30", isdone: false),
      TodoModel(
          id: "2", todotext: "Estuda Python 14:45 as 18:00", isdone: false),
      TodoModel(
          id: "3", todotext: "Estuda Flutter 18:30 as 20:00", isdone: false),
    ];
  }
}
