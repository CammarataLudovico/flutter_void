import 'package:flutter/material.dart';
import 'package:prova/Contact.dart';

void main() {
  runApp(const MyApp());
}

void _addContact() {
  // da fare
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact List',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: ContactListPage(),
    );
  }
}

class ContactListPage extends StatelessWidget {
  ContactListPage({super.key});

  final List<Contact> contactsList = [
    Contact(firstName: "Mario", lastName: "Rossi", phoneNumbersList: ["320 99 324 333", "320 99 384 332"]),
    Contact(firstName: "Gianni", lastName: "Verdi", phoneNumbersList: ["340 99 384 332"]),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact List'),
      ),
      body: ListView(
        children: contactsList.map((contact) {
          return ListTile(
            title: Text('Contatto: ${contact.firstName} ${contact.lastName}'),
            subtitle: Text('Telefono: ${contact.phoneNumbersList.join(', ')}'),
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addContact,
        tooltip: 'add contact',
        child: const Icon(Icons.add),
      ), 
    );
  }
}


