import 'package:flutter/material.dart';
import 'todo.dart';
import 'package:reactive_forms/reactive_forms.dart';

class AddTodoFormDialog extends StatefulWidget {
  const AddTodoFormDialog({super.key});

  @override
  State<AddTodoFormDialog> createState() => _AddTodoFormDialogState();
}

class _AddTodoFormDialogState extends State<AddTodoFormDialog> {
  late final FormGroup _form;

  @override
  void initState() {
    super.initState();
    _form = FormGroup({
      "title": FormControl<String>(
        value: "",
        validators: [Validators.required, Validators.minLength(3)],
      ),
      "description": FormControl<String>(
        value: "",
        validators: [Validators.required, Validators.minLength(20)],
      ),
      "t&c": FormControl<bool>(
        value: false,
        validators: [Validators.requiredTrue],
      ),
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: ReactiveForm(
          formGroup: _form,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("nuovo todo!", style: theme.textTheme.headlineSmall),
              SizedBox(height: 40),
              ReactiveTextField<String>(
                formControlName: "title",
                decoration: InputDecoration(hintText: "titolo..."),
                validationMessages: {
                  ValidationMessage.required: (_) => "Ttile is required!",
                  ValidationMessage.minLength: (error) =>
                      'At least 3 characters!',
                },
              ),
              ReactiveTextField(
                formControlName: "description",
                decoration: InputDecoration(hintText: "descrizione..."),
              ),
              SizedBox(height: 20),
              ReactiveCheckboxListTile(formControlName: "t&c"),
              SizedBox(height: 80),
              ElevatedButton(onPressed: _submit, child: Text("salva!")),
            ],
          ),
        ),
      ),
    );
  }

  void _submit() {
    if (!_form.valid) return;

    final todo = Todo(
      createdAt: DateTime.now(),
      title: _form.control("title").value,
      description: _form.control("description").value,
      isDone: _form.control("t&c").value,
    );

    Navigator.pop(context, todo);
    return;
  }
}

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({super.key});

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  late final FormGroup _form;

  @override
  void initState() {
    super.initState();
    _form = FormGroup({
      "title": FormControl<String>(
        value: "",
        validators: [Validators.required, Validators.minLength(3)],
      ),
      "description": FormControl<String>(
        value: "",
        validators: [Validators.required, Validators.minLength(20)],
      ),
      // checkbox must be true
      "t&c": FormControl<bool>(
        value: false,
        validators: [Validators.requiredTrue],
      ),
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Task'),
        backgroundColor: theme.colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ReactiveForm(
          formGroup: _form,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("new todo!", style: theme.textTheme.headlineSmall),
              SizedBox(height: 40),
              ReactiveTextField(
                formControlName: "title",
                decoration: InputDecoration(hintText: "title..."),
                validationMessages: {
                  ValidationMessage.required: (_) => 'Title is required!',
                  ValidationMessage.minLength: (error) =>
                      'At least ${(error as Map<String, dynamic>)['requiredLength']} characters!',
                },
              ),
              ReactiveTextField(
                formControlName: "description",
                decoration: InputDecoration(hintText: "description..."),
                validationMessages: {
                  ValidationMessage.required: (_) => 'Description is required!',
                  ValidationMessage.minLength: (error) =>
                      'At least ${(error as Map<String, dynamic>)['requiredLength']} characters!',
                },
              ),
              SizedBox(height: 20),
              ReactiveCheckboxListTile(
                formControlName: "t&c",
                title: const Text("Accept terms and condition of the Application!"),
              ),
              SizedBox(height: 80),
              ElevatedButton(onPressed: _submit, child: Text("Save!")),
            ],
          ),
        ),
      ),
    );
  }

  void _submit() {
    if (!_form.valid) return;

    final todo = Todo(
      createdAt: DateTime.now(),
      title: _form.control("title").value,
      description: _form.control("description").value,
      isDone: _form.control("t&c").value,
    );

    Navigator.pop(context, todo);
    return;
  }
}
