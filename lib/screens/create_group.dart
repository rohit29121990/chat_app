import 'package:chat_app/model/chat_model.dart';
import 'package:chat_app/widget/avtar_card.dart';
import 'package:chat_app/widget/contact_card.dart';
import 'package:flutter/material.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({Key? key}) : super(key: key);

  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

List<ChatModel> contacts = [
  ChatModel(name: 'DevStack', status: 'A fullstack developer'),
  ChatModel(name: 'saket', status: 'A fullstack developer'),
  ChatModel(name: 'john', status: 'A fullstack developer'),
  ChatModel(name: 'sanjay', status: 'A fullstack developer'),
  ChatModel(name: 'milind', status: 'A fullstack developer'),
  ChatModel(name: 'kumar', status: 'A fullstack developer'),
  ChatModel(name: 'BalRam', status: 'A fullstack developer')
];
List<ChatModel> group = [];

class _CreateGroupState extends State<CreateGroup> {
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
                  'New Group',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Add Participants',
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
          ]),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: group.isNotEmpty ? 80.0 : 0),
            child: ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                return ContactCard(
                    onTap: () {
                      if (contacts[index].selected == false) {
                        setState(() {
                          contacts[index].selected = true;
                          group.add(contacts[index]);
                        });
                      } else {
                        setState(() {
                          contacts[index].selected = false;
                          group.remove(contacts[index]);
                        });
                      }
                    },
                    contacts: contacts[index]);
              },
            ),
          ),
          if (group.isNotEmpty)
            Column(
              children: [
                Container(
                  color: Colors.white,
                  height: 74,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: contacts.length,
                      itemBuilder: (context, index) {
                        return contacts[index].selected!
                            ? InkWell(
                                onTap: () {
                                  setState(() {
                                    contacts[index].selected = false;
                                    group.remove(contacts[index]);
                                  });
                                },
                                child: AvtarCard(
                                  contacts: contacts[index],
                                ),
                              )
                            : Container();
                      }),
                ),
                const Divider(thickness: 1)
              ],
            )
        ],
      ),
    );
  }
}
