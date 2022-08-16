import 'package:chat_app/model/chat_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../screens/constents.dart';

class ContactCard extends StatelessWidget {
  ContactCard({Key? key, required this.contacts, this.onTap}) : super(key: key);
  final ChatModel contacts;
  final Function? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => onTap!(),
      leading: Container(
        height: 50,
        width: 52,
        child: Stack(
          children: [
            CircleAvatar(
              radius: 22,
              child: SvgPicture.asset(
                person,
                color: Colors.white,
                height: 30,
                width: 30,
              ),
              backgroundColor: Colors.blueGrey[200],
            ),
            if (contacts.selected!)
              const Positioned(
                bottom: 4,
                right: 5,
                child: CircleAvatar(
                  backgroundColor: Colors.teal,
                  radius: 10,
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              )
          ],
        ),
      ),
      title: Text(
        contacts.name!,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(contacts.status!, style: TextStyle(fontSize: 12)),
    );
  }
}
