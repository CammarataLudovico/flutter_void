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
      'greeting': FormControl<String>(value: ''),
      'name': FormControl<String>(value: ''),
    });
  }

  @override
  void dispose() {
    _form.dispose();
    super.dispose();
  }

  void _updateGreeting() {
    final greeting = _form.control('greeting').value;
    final name = _form.control('name').value;

    setState(() {
      if (greeting.isNotEmpty && name.isNotEmpty) {
        _message = "$greeting $name";
      } else if (greeting.isNotEmpty) {
        _message = greeting;
      } else if (name.isNotEmpty) {
        _message = name;
      } else {
        _message = '';
      }
    });
  }

  void _clearForm() {
    // reset control with value '' to avoid "null" value and error
    _form.reset(value: {'greeting': '', 'name': ''});
    setState(() {
      _message = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("1.2 personal greeter")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ReactiveForm(
          formGroup: _form,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ReactiveTextField<String>(
                formControlName: 'greeting',
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Your Greeting (ciao, hello, yo, hi...)',
                ),
                onChanged: (_) =>
                    _updateGreeting(), // '_' ignore the parameter, i only want to know if it changed
              ),
              const SizedBox(height: 20),
              ReactiveTextField(
                formControlName: 'name',
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Your Name - Mario, Paolo....',
                ),
                onChanged: (_) =>
                    _updateGreeting(), // '_' ignore the parameter, i only want to know if it changed
              ),
              const SizedBox(height: 20),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
