import 'package:chat_app/model/chat_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../screens/constents.dart';

class AvtarCard extends StatelessWidget {
  AvtarCard({Key? key, this.contacts}) : super(key: key);
  final ChatModel? contacts;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(children: [
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
            const Positioned(
              bottom: 0,
              right: 0,
              child: CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 10,
                child: Icon(
                  Icons.clear,
                  color: Colors.white,
                  size: 12,
                ),
              ),
            )
          ]),
          const SizedBox(height: 2),
          Text(
            contacts!.name!,
            style: TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }
}
