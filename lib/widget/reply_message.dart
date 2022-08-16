import 'package:flutter/material.dart';

import '../model/message_model.dart';

class ReplyMessage extends StatelessWidget {
  const ReplyMessage({Key? key, required this.message}) : super(key: key);
  final MessageModel message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 45,
        ),
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          child: Stack(children: [
            Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 60, bottom: 20, top: 10),
                child: Text(
                  message.message,
                  style: const TextStyle(fontSize: 16),
                )),
            Positioned(
              bottom: 4,
              right: 10,
              child: Text(
                message.time,
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
