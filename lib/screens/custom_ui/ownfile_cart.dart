import 'dart:io';

import 'package:flutter/material.dart';

class OweFileCart extends StatelessWidget {
  const OweFileCart({Key? key, required this.path}) : super(key: key);
  final String path;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.green[300]),
          height: MediaQuery.of(context).size.height / 2.3,
          width: MediaQuery.of(context).size.width / 2,
          child: Card(
            child: Column(
              children: [
                Image.file(
                  File(path),
                  fit: BoxFit.fitHeight,
                ),
                Text('')
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
