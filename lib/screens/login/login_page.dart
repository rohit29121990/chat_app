import 'package:chat_app/screens/home_page.dart';
import 'package:chat_app/widget/button_card.dart';
import 'package:flutter/material.dart';

import '../../model/chat_model.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  late ChatModel sourceChat;
  List<ChatModel> chatModels = [
    ChatModel(
        id: 1,
        currentMessage: 'New flutter post',
        icon: 'assets/groups.svg',
        isGroup: false,
        name: 'Flutter community',
        time: '02:45'),
    ChatModel(
        id: 2,
        currentMessage: 'Hi, BalRam',
        icon: 'assets/groups.svg',
        isGroup: false,
        name: 'BalRam Rathor',
        time: '03:05'),
    ChatModel(
        id: 3,
        currentMessage: 'Hi, node',
        icon: 'assets/groups.svg',
        isGroup: false,
        name: 'Node group',
        time: '04:35'),
    ChatModel(
        id: 4,
        currentMessage: 'Hi, Buddy',
        icon: 'assets/groups.svg',
        isGroup: false,
        name: 'Buddy',
        time: '08:15'),
    ChatModel(
        id: 5,
        currentMessage: 'Hi, Kishor',
        icon: 'assets/groups.svg',
        isGroup: false,
        name: 'Kishor',
        time: '02:15'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: chatModels.length,
          itemBuilder: (context, index) {
            return ButtonCard(
                name: chatModels[index].name!,
                icon: Icons.person,
                onTap: () {
                  sourceChat = chatModels.removeAt(index);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomePage(
                                chatModels: chatModels,
                                sourceChat: sourceChat,
                              )));
                });
          }),
    );
  }
}
