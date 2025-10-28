class Todo {
  Todo({
    required this.createdAt,
    required this.title,
    required this.description,
    this.isDone = false, // Initial State setting, non serve passare valore
    this.expiresAt,
  });
  bool isDone;
  String title;
  String description;
  DateTime createdAt;
  DateTime? expiresAt;
}

void f() {
  // TODO: Costruisci un todo
  final todo = Todo(
    createdAt: DateTime.now(),
    title: "Cervo",
    description: "Fagiano",
    isDone: true,
    expiresAt: DateTime(2026, 03, 12),
  );
  print(todo.isDone);
}
