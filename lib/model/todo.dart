class ToDo {
  String? id;
  String? toDoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.toDoText,
    this.isDone = false,
  });

  static List<ToDo> toDoList() {
    return [
      ToDo(id: '01', toDoText: 'No Fap', isDone: true),
      ToDo(id: '02', toDoText: 'Evening Exercise'),
      ToDo(id: '03', toDoText: 'Meeting with Zaquiel'),
      ToDo(id: '04', toDoText: 'Wash the dishes'),
    ];
  }
}
