import 'dart:io';

import 'package:chat_app/screens/constents.dart';
import 'package:flutter/material.dart';

class ReplyFileCard extends StatelessWidget {
  const ReplyFileCard(
      {Key? key, required this.path, required this.message, required this.time})
      : super(key: key);
  final String path;
  final String message;
  final String time;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16), color: Colors.grey[400]),
          height: MediaQuery.of(context).size.height / 2.3,
          width: MediaQuery.of(context).size.width / 2,
          child: Card(
            child: Column(
              children: [
                Expanded(
                  child: Image.network(
                    '$baseurl:$port/uploads/$path',
                    fit: BoxFit.fitHeight,
                  ),
                ),
                message.isNotEmpty
                    ? Container(
                        height: 40,
                        padding: const EdgeInsets.only(left: 15, top: 8),
                        child: Text(
                          message,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ))
                    : Container()
              ],
            ),
            margin: EdgeInsets.all(3),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          ),
        ),
      ),
    );
  }
}
