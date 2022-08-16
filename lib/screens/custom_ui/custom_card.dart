import 'package:chat_app/model/chat_model.dart';
import 'package:chat_app/screens/chat/individual_chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomCard extends StatelessWidget {
  CustomCard({Key? key, required this.chatModel, required this.sourceChat})
      : super(key: key);
  final ChatModel chatModel;
  final ChatModel sourceChat;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                IndividiualPage(chatModel: chatModel, sourceChat: sourceChat),
          ),
        );
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.blueGrey,
              child: SvgPicture.asset(
                chatModel.isGroup! ? 'assets/groups.svg' : 'assets/person.svg',
                height: 36,
                width: 36,
                color: Colors.white,
              ),
            ),
            trailing: Text(chatModel.time!),
            title: Text(
              chatModel.name!,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            subtitle: Row(
              children: [
                Icon(Icons.done_all),
                SizedBox(width: 4),
                Text(chatModel.currentMessage!)
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 20, left: 80),
            child: Divider(
              thickness: 1.4,
            ),
          )
        ],
      ),
    );
  }
}
