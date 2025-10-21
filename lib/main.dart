import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: GreeterWidget(),
    ),
  );
}

class GreeterWidget extends StatefulWidget {
  const GreeterWidget({super.key});

  @override
  State<GreeterWidget> createState() => _GreeterWidgetState();
}

class _GreeterWidgetState extends State<GreeterWidget> {
  late final TextEditingController _controller;
  String _message = '';

  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  void dispose() {  }

  void _updateGreeting() {
    // TODO ...
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("1.2 personal greeting"),
      ),
    body: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            controller: _controller,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter Your Name',
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _updateGreeting,
            child: const Text('Say Hello'),
          ),
          const SizedBox(height: 30),
          Text(
            _message,
          ),
        ],
      ),
    ));
  }
}