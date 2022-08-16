import 'package:chat_app/model/chat_model.dart';
import 'package:chat_app/screens/constents.dart';
import 'package:chat_app/screens/create_group.dart';
import 'package:chat_app/widget/button_card.dart';
import 'package:chat_app/widget/contact_card.dart';
import 'package:flutter/material.dart';

class SelectContact extends StatefulWidget {
  const SelectContact({Key? key}) : super(key: key);

  @override
  State<SelectContact> createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
  List<ChatModel> contacts = [
    ChatModel(name: 'DevStack', status: 'A fullstack developer'),
    ChatModel(name: 'saket', status: 'A fullstack developer'),
    ChatModel(name: 'john', status: 'A fullstack developer'),
    ChatModel(name: 'sanjay', status: 'A fullstack developer'),
    ChatModel(name: 'milind', status: 'A fullstack developer'),
    ChatModel(name: 'kumar', status: 'A fullstack developer'),
    ChatModel(name: 'BalRam', status: 'A fullstack developer')
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: false,
          title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  'Select Contact',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  '26 Contacts',
                  style: TextStyle(fontSize: 12),
                ),
              ]),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  size: 26,
                )),
            popupMenuContact
          ]),
      body: ListView.builder(
        itemCount: contacts.length + 2,
        itemBuilder: (context, index) {
          if (index == 0) {
            return ButtonCard(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CreateGroup()));
              },
              icon: Icons.group,
              name: 'New Group',
            );
          } else if (index == 1) {
            return ButtonCard(
              onTap: () {
                print('fdsfsf');
              },
              icon: Icons.person_add,
              name: 'New Contact',
            );
          } else {
            return ContactCard(contacts: contacts[index - 2]);
          }
        },
      ),
    );
  }
}
