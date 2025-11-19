import "package:contact_list_2_3/Contact.dart";
import "package:flutter/material.dart";
import "package:reactive_forms/reactive_forms.dart";

class AddContactFormDialog extends StatefulWidget {
  const AddContactFormDialog({super.key, this.contact});
  final Contact? contact;

  @override
  State<AddContactFormDialog> createState() => _AddContactFormDialogState();
}

class _AddContactFormDialogState extends State<AddContactFormDialog> {
  late final FormGroup _form;

  @override
  void initState() {
    super.initState();
    final isEdit = widget.contact != null;
    final initialFirst = widget.contact?.firstName ?? "";
    final initialLast = widget.contact?.lastName ?? "";
    final initialPhones = widget.contact?.phoneNumbersList ?? [""];

    _form = FormGroup({
      "firstName": FormControl<String>(
        value: initialFirst,
        validators: [Validators.required, Validators.minLength(3)],
      ),
      "lastName": FormControl<String>(
        value: initialLast,
        validators: [Validators.required, Validators.minLength(3)],
      ),
      "phones": (() {
        final controls = <FormControl<String>>[];
        for (var i = 0; i < initialPhones.length; i++) {
          final p = initialPhones[i];
          if (i == 0) {
            controls.add(
              FormControl<String>(
                value: p,
                validators: [
                  Validators.required,
                  Validators.pattern(r"^\d{10}$"),
                ],
              ),
            );
          } else {
            controls.add(
              FormControl<String>(
                value: p,
                validators: [Validators.pattern(r"^$|^\d{10}$")],
              ),
            );
          }
        }
        return FormArray(controls);
      })(),
      "t&c": FormControl<bool>(
        value: isEdit ? true : false,
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

    final isEdit = widget.contact != null;

    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: ReactiveForm(
          formGroup: _form,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                isEdit ? "Modifica Contatto" : "Nuovo Contatto!",
                style: theme.textTheme.headlineSmall,
              ),
              const SizedBox(height: 20),
              ReactiveTextField<String>(
                formControlName: "firstName",
                decoration: const InputDecoration(hintText: "Nome..."),
                validationMessages: {
                  ValidationMessage.required: (_) => "Il nome è obbligatorio!",
                  ValidationMessage.minLength: (error) =>
                      "Il nome deve essere lungo almeno 3 caratteri!",
                },
              ),
              ReactiveTextField<String>(
                formControlName: "lastName",
                decoration: const InputDecoration(hintText: "Cognome..."),
                validationMessages: {
                  ValidationMessage.required: (_) =>
                      "Il cognome è obbligatorio!",
                  ValidationMessage.minLength: (error) =>
                      "Il cognome deve essere lungo almeno 3 caratteri!",
                },
              ),
              const SizedBox(height: 12),

              ReactiveFormArray(
                formArrayName: "phones",
                builder: (context, formArray, child) {
                  final fa = formArray as FormArray;
                  return Column(
                    children: [
                      for (var i = 0; i < fa.controls.length; i++)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: Row(
                            children: [
                              Expanded(
                                child: ReactiveTextField<String>(
                                  formControlName: i.toString(),
                                  keyboardType: TextInputType.phone,
                                  decoration: const InputDecoration(
                                    hintText: "Numero di telefono...",
                                  ),
                                  validationMessages: {
                                    ValidationMessage.required: (_) =>
                                        "Il Numero di Telefono è obbligatorio!",
                                    ValidationMessage.pattern: (_) =>
                                        "Il Numero di Telefono deve essere di 10 cifre (solo numeri)!",
                                  },
                                ),
                              ),
                              const SizedBox(width: 8),
                              if (fa.controls.length > 1)
                                IconButton(
                                  icon: const Icon(
                                    Icons.remove_circle,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      fa.removeAt(i);
                                    });
                                  },
                                ),
                            ],
                          ),
                        ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton.icon(
                          onPressed: () {
                            setState(() {
                              fa.add(
                                FormControl<String>(
                                  value: "",
                                  validators: [
                                    Validators.pattern(r"^$|^\d{10}$"), // regex to allow only 10 numbers
                                  ],
                                ),
                              );
                            });
                          },
                          icon: const Icon(Icons.add),
                          label: const Text("Aggiungi numero"),
                        ),
                      ),
                    ],
                  );
                },
              ),

              const SizedBox(height: 12),
              ReactiveCheckboxListTile(
                formControlName: "t&c",
                title: const Text("Accetta termini e condizioni"),
              ),
              const SizedBox(height: 20),
              ReactiveFormConsumer(
                builder: (context, form, child) {
                  return ElevatedButton(
                    onPressed: form.valid ? _submit : null,
                    child: Text(
                      isEdit ? "Aggiorna contatto" : "Salva contatto!",
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submit() {
    if (!_form.valid) return;

    final phones = (_form.control("phones") as FormArray).controls
        .map((c) => (c.value ?? "").toString().trim())
        .where((s) => s.isNotEmpty)
        .toList();

    final contact = Contact(
      firstName: _form.control("firstName").value as String,
      lastName: _form.control("lastName").value as String,
      phoneNumbersList: phones,
    );

    Navigator.pop(context, contact);
    return;
  }
}
