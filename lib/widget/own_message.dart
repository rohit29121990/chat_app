import 'package:chat_app/model/message_model.dart';
import 'package:flutter/material.dart';

class OwnMessage extends StatelessWidget {
  const OwnMessage({Key? key, required this.message}) : super(key: key);
  final MessageModel message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 45,
        ),
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          color: const Color(0xffdcf8c6),
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
              child: Row(
                children: [
                  Text(
                    message.time,
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                  const SizedBox(width: 5),
                  const Icon(
                    Icons.done_all,
                    size: 20,
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
