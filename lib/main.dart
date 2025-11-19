import "package:contact_list_2_3/Contact.dart";
import "package:contact_list_2_3/Contact_detail.dart";
import "package:contact_list_2_3/data/contact_data.dart";
import "package:contact_list_2_3/form.dart";
import "package:flutter/material.dart";
import "package:share_plus/share_plus.dart";

void main() {
  runApp(const MyApp());
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

class ContactListPage extends StatefulWidget {
  const ContactListPage({super.key});

  @override
  State<ContactListPage> createState() => _ContactListPageState();
}

class _ContactListPageState extends State<ContactListPage> {
  Future<void> _addContact() async {
    final newContact = await showDialog<Contact>(
      context: context,
      builder: (context) => const AddContactFormDialog(),
    );

    if (newContact != null) {
      setState(() {
        contactsList.add(newContact);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Contatto aggiunto")),
      );
    }
  }

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
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.share),
                  onPressed: () async {
                    final phones = contact.phoneNumbersList.join("\n");
                    final text =
                        "Contatto: ${contact.firstName} ${contact.lastName}\nTelefoni:\n$phones";

                    final params = ShareParams(
                      text: text,
                      subject: "Dettagli contatto",
                    );

                    final result = await SharePlus.instance.share(params);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () async {
                    final updated = await showDialog<Contact>(
                      context: context,
                      builder: (context) =>
                          AddContactFormDialog(contact: contact),
                    );
                    if (updated != null) {
                      setState(() {
                        final idx = contactsList.indexOf(contact);
                        if (idx != -1) contactsList[idx] = updated;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Contatto aggiornato")),
                      );
                    }
                  },
                ),
              ],
            ),
            onTap: () async {
              await Navigator.push<void>(
                context,
                MaterialPageRoute<void>(
                  builder: (context) => ContactDetail(contact: contact),
                ),
              );
              setState(() {});
            },
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addContact,
        tooltip: "add contact",
        child: const Icon(Icons.add),
      ),
    );
  }
}
