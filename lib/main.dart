import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Color Changer Page',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const ColorChangerPage(),
    );
  }
}

class ColorChangerPage extends StatefulWidget {
  const ColorChangerPage({super.key});

  @override
  State<ColorChangerPage> createState() =>
      _ColorChangerPageState();
}

class _ColorChangerPageState extends State<ColorChangerPage> {
  // TODO: add a state variable (:
  Color _backgroundColor = Colors.white70;

  void _changeColor(Color newColor) {
    // TODO
    setState(() {
      _backgroundColor = newColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Background Color Changer'),
        backgroundColor: Colors.black87,
      ),
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        color: _backgroundColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Tap a button to change the color!',
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    onPressed: () => _changeColor(Colors.red), 
                    child: const Text('Red'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    onPressed: () => _changeColor(Colors.green), 
                    child: const Text('Green'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    onPressed: () => _changeColor(Colors.blue), 
                    child: const Text('Blue'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}