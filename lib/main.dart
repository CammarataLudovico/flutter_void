import "package:contact_list_2_3/Contact_detail.dart";
import "package:contact_list_2_3/data/contact_data.dart";
import "package:flutter/material.dart";

void main() {
  runApp(const MyApp());
}

void _addContact() {
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Project 2.3: Contact List",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const ContactListPage(),
    );
  }
}

class ContactListPage extends StatelessWidget {
  const ContactListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Project 2.3: Contact List"),
      ),
      body: ListView(
        children: contactsList.map((contact) {
          return ListTile(
            leading: const Icon(Icons.phone),
            title: Text("Contatto: ${contact.firstName} ${contact.lastName}"),
            onTap: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ContactDetail(contact: contact),
                ),
              );
            },
          );
        }).toList(),
      ),
      floatingActionButton: const FloatingActionButton(
        onPressed: _addContact,
        tooltip: "add contact",
        child: Icon(Icons.add),
      ),
    );
  }
}
