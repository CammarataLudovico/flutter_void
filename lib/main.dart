import "dart:math";
import "package:flutter/material.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color _seedColor = Colors.deepPurple;

  void _randomizeSeed() {
    final rnd = Random();
    final randomColor = Colors.primaries[rnd.nextInt(Colors.primaries.length)];
    setState(() {
      _seedColor = randomColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Project 3.2: A Better Color changer",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: _seedColor),
      ),
      home: ColorChangerPage(onRandomize: _randomizeSeed),
    );
  }
}

class ColorChangerPage extends StatefulWidget {
  const ColorChangerPage({super.key, this.onRandomize});
  final VoidCallback? onRandomize;

  @override
  State<ColorChangerPage> createState() => _ColorChangerPageState();
}

class _ColorChangerPageState extends State<ColorChangerPage> {
  Color _backgroundColor = Colors.white70;
  bool isSwitched = false;
  Brightness brightness = Brightness.light;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Project 3.2: A Better Color changer"),
        backgroundColor: Colors.black87,
      ),
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        color: _backgroundColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Tap a button to change the color!",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: isSwitched ? Colors.white70 : Colors.black87,
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    onPressed: () {
                      setState(() {
                        _backgroundColor = Colors.red;
                        isSwitched = false;
                      });
                    },
                    child: const Text(
                      "Red",
                      style: TextStyle(
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    onPressed: () {
                      setState(() {
                        _backgroundColor = Colors.green;
                        isSwitched = false;
                      });
                    },
                    child: const Text(
                      "Green",
                      style: TextStyle(
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                    ),
                    onPressed: () {
                      setState(() {
                        _backgroundColor = Colors.purple;
                        isSwitched = false;
                      });
                    },
                    child: const Text(
                      "Purple",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    isSwitched ? "Dark mode" : "Light Mode",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: isSwitched ? Colors.white70 : Colors.black87,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Switch(
                    value: isSwitched,
                    onChanged: (value) {
                      setState(() {
                        isSwitched = value;
                        brightness = value ? Brightness.dark : Brightness.light;
                        _backgroundColor = (brightness == Brightness.dark)
                            ? Colors.black87
                            : Colors.white70;
                      });
                    },
                  ),
                  const SizedBox(width: 24),
                  FloatingActionButton(
                    onPressed: () {
                      final rnd = Random();
                      final randomColor = Colors
                          .primaries[rnd.nextInt(Colors.primaries.length)];
                      setState(() {
                        _backgroundColor = randomColor;
                        isSwitched = false;
                      });
                    },
                    tooltip: "Randomize background",
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    child: const Icon(Icons.shuffle),
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