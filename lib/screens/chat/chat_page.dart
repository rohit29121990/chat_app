import 'package:chat_app/screens/contact/select_contact.dart';
import 'package:flutter/material.dart';
import '../../model/chat_model.dart';
import '../custom_ui/custom_card.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key, required this.chatModels, required this.sourceChat})
      : super(key: key);
  final List<ChatModel>? chatModels;
  final ChatModel? sourceChat;
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: widget.chatModels!.length,
        itemBuilder: (context, index) {
          return CustomCard(
            chatModel: widget.chatModels![index],
            sourceChat: widget.sourceChat!,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => SelectContact()));
        },
        child: const Icon(Icons.chat),
      ),
    );
  }
}
