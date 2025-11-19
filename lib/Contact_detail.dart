import "package:contact_list_2_3/Contact.dart";
import "package:contact_list_2_3/data/contact_data.dart";
import "package:contact_list_2_3/form.dart";
import "package:flutter/material.dart";
import "package:url_launcher/url_launcher.dart";

class ContactDetail extends StatefulWidget {
  const ContactDetail({required this.contact, super.key});
  final Contact contact;

  @override
  State<ContactDetail> createState() => _ContactDetailState();
}

class _ContactDetailState extends State<ContactDetail> {
  late Contact contact;

  @override
  void initState() {
    super.initState();
    contact = widget.contact;
  }

  Future<void> _callPhone(BuildContext context, String phone) async {
    final uri = Uri(scheme: "tel", path: phone);
    try {
      if (!await launchUrl(uri)) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Impossibile avviare la chiamata")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Errore: $e")),
      );
    }
  }

  Future<void> _editContact(BuildContext context) async {
    final Contact? updated = await showDialog<Contact>(
      context: context,
      builder: (context) => AddContactFormDialog(contact: contact),
    );
    if (updated != null) {
      final idx = contactsList.indexOf(contact);
      if (idx != -1) {
        setState(() {
          contactsList[idx] = updated;
          contact = updated;
        });
      }
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Contatto aggiornato")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${contact.firstName} ${contact.lastName}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Numeri",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: contact.phoneNumbersList.length,
                itemBuilder: (context, index) {
                  final phone = contact.phoneNumbersList[index];
                  return ListTile(
                    leading: const Icon(Icons.phone),
                    title: Text(phone),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.call),
                          onPressed: () => _callPhone(context, phone),
                        ),
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () => _editContact(context),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
