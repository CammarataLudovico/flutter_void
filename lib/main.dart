import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: GreeterWidget()));
}

class GreeterWidget extends StatefulWidget {
  const GreeterWidget({super.key});

  @override
  State<GreeterWidget> createState() => _GreeterWidgetState();
}

class _GreeterWidgetState extends State<GreeterWidget> {
  late final TextEditingController _helloController;
  late final TextEditingController _yoController;
  String _message = '';

  void initState() {
    super.initState();
    _helloController = TextEditingController();
    _yoController = TextEditingController();
  }

  void dispose() {
    setState(() {
      _message = "";
      _helloController.clear();
      _yoController.clear();
    });
  }

  void _updateGreeting() {
    setState(() {
      if (_helloController.text.isEmpty && _yoController.text.isNotEmpty) {
        _message = "Yo ${_yoController.text}";
      } else if (_helloController.text.isNotEmpty && _yoController.text.isEmpty) {
        _message = "Hello ${_helloController.text}";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("1.2 personal greeting")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _helloController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Your Name - HELLO',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _yoController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Your Name - YO',
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _updateGreeting,
                    style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )    
                    ),
                    child: const Text('Say Hello'),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: dispose,
                    style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )    
                    ),
                    child: const Text('Clear'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Text(_message),
          ],
        ),
      ),
    );
  }
}
