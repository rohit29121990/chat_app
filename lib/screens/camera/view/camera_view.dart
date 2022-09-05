import 'dart:io';

import 'package:flutter/material.dart';

class CameraViewPage extends StatelessWidget {
  CameraViewPage({Key? key, required this.path, required this.onImageSend})
      : super(key: key);
  final String path;
  final Function(String) onImageSend;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.black, actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.crop_rotate,
            size: 26,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.emoji_emotions_outlined,
            size: 26,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.title,
            size: 26,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.edit,
            size: 26,
          ),
        )
      ]),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 150,
            child: Image.file(
              File(path),
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              color: Colors.black38,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: TextFormField(
                  maxLines: 6,
                  minLines: 1,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                  decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.add_photo_alternate,
                        color: Colors.white,
                        size: 26.8,
                      ),
                      suffixIcon: InkWell(
                        onTap: () {
                          onImageSend(path);
                        },
                        child: CircleAvatar(
                          radius: 26,
                          backgroundColor: Colors.tealAccent[700],
                          child: const Icon(
                            Icons.check,
                            size: 26.8,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      hintStyle:
                          const TextStyle(color: Colors.white, fontSize: 16),
                      hintText: 'Add Caption ....',
                      border: InputBorder.none)),
            ),
          )
        ]),
      ),
    );
  }
}
