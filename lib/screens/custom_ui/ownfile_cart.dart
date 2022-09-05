import 'dart:io';

import 'package:flutter/material.dart';

class OweFileCart extends StatelessWidget {
  const OweFileCart(
      {Key? key, required this.path, required this.message, required this.time})
      : super(key: key);
  final String path;
  final String message;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Container(
          height: MediaQuery.of(context).size.height / 2.3,
          width: MediaQuery.of(context).size.width / 1.8,
          decoration: BoxDecoration(
            color: Colors.green[300],
            borderRadius: BorderRadius.circular(15),
          ),
          child: Card(
            child: Column(
              children: [
                Expanded(
                  child: Image.file(
                    File(path),
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
            margin: const EdgeInsets.all(3),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          ),
        ),
      ),
    );
  }
}
