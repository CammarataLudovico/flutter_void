import 'package:flutter/material.dart';
import 'form.dart';
import 'todo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '2.1: A simple To-Do List',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
      ),
      home: const MyHomePage(title: '2.1: A simple To-Do List'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _list = <Todo>[];
  bool _showDoneOnly = false;

  List<Todo> get _filtered =>
      _showDoneOnly ? _list.where((t) => t.isDone).toList() : _list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          ElevatedButton.icon(
            icon: Icon(_showDoneOnly ? Icons.filter_alt_off : Icons.filter_alt),
            onPressed: () {
              setState(() {
                _showDoneOnly = !_showDoneOnly;
              });
            },
            label: Text(_showDoneOnly ? 'Show All' : 'Show Done'),
          ),
          SizedBox(width: 8),
          ElevatedButton.icon(
            icon: Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                for (var i = 0; i < _list.length; i++) {
                  _list[i].isDone = false;
                }
              });
            },
            label: const Text('Reset All'),
          ),
          SizedBox(width: 8),
          ElevatedButton.icon(
            icon: Icon(Icons.invert_colors),
            onPressed: () {
              setState(() {
                for (var i = 0; i < _list.length; i++) {
                  _list[i].isDone = !_list[i].isDone;
                }
              });
            },
            label: const Text('Invert All'),
          ),
          SizedBox(width: 20),
        ],
      ),
      body: Center(
        child: ListView(
          children: [
            if (_filtered.isEmpty)
              Text(_showDoneOnly ? "No ToDo completed!" : "There's no ToDo"),
            for (final todo in _filtered)
              CheckboxListTile(
                value: todo.isDone,
                title: Text(
                  todo.title,
                  style: TextStyle(
                    decoration: todo.isDone
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
                subtitle: Text(
                  todo.description,
                  style: TextStyle(
                    decoration: todo.isDone
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
                onChanged: (value) {
                  if (value == null) return;
                  setState(() {
                    final origIndex = _list.indexOf(todo);
                    if (origIndex != -1) _list[origIndex].isDone = value;
                  });
                },
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _createTodo,
        child: Icon(Icons.add),
      ),
    );
  }

  Future<void> _createTodo() async {
    final result = await Navigator.push<Todo>(
      context,
      MaterialPageRoute(builder: (context) => const AddTodoPage()),
    );

    if (result == null) return;

    setState(() {
      _list.add(result);
    });
  }
}
