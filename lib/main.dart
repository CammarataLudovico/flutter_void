import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

void main() {
  runApp(const MaterialApp(home: GreeterWidget()));
}

class GreeterWidget extends StatefulWidget {
  const GreeterWidget({super.key});

  @override
  State<GreeterWidget> createState() => _GreeterWidgetState();
}

class _GreeterWidgetState extends State<GreeterWidget> {
  late final FormGroup _form;
  String _message = '';

  @override
  void initState() {
    super.initState();
    _form = FormGroup({
      'helloName': FormControl<String>(value: ''),
      'yoName': FormControl<String>(value: ''),
    });
  }

  @override
  void dispose() {
    _form.dispose();
    super.dispose();
  }

  void _updateGreeting() {
    final _helloControllerName =
        _form.control('helloName').value as String? ?? '';
    final _yoControllerName = _form.control('yoName').value as String? ?? '';

    setState(() {
      if (_helloControllerName.isEmpty && _yoControllerName.isNotEmpty) {
        _message = "Yo $_yoControllerName";
      } else if (_helloControllerName.isNotEmpty && _yoControllerName.isEmpty) {
        _message = "Hello $_helloControllerName";
      }
    });
  }

  void _clearForm() {
    _form.reset();
    setState(() {
      _message = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("1.2 personal greeting")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ReactiveForm(
          formGroup: _form,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ReactiveTextField<String>(
                formControlName: 'helloName',
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Your Name - HELLO',
                ),
              ),
              const SizedBox(height: 20),
              ReactiveTextField(
                formControlName: 'yoName',
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
                        ),
                      ),
                      child: const Text('Say Hello'),
                    ),
                    const SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: _clearForm,
                      style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
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
      ),
    );
  }
}
