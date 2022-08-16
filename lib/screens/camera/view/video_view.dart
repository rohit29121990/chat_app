import 'dart:io';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoViewPage extends StatefulWidget {
  VideoViewPage({Key? key, required this.path}) : super(key: key);
  String path;

  @override
  State<VideoViewPage> createState() => _VideoViewPageState();
}

class _VideoViewPageState extends State<VideoViewPage> {
  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(File(widget.path))
      ..initialize().then((value) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.black, actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.crop_rotate, size: 26),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.emoji_emotions_outlined, size: 26),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.title, size: 26),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.edit, size: 26),
        )
      ]),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 150,
            child: _controller.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  )
                : Container(),
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
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.add_photo_alternate,
                          color: Colors.white, size: 26.8),
                      suffixIcon: CircleAvatar(
                        radius: 26,
                        backgroundColor: Colors.tealAccent[700],
                        child: const Icon(
                          Icons.check,
                          size: 26.8,
                          color: Colors.white,
                        ),
                      ),
                      hintStyle:
                          const TextStyle(color: Colors.white, fontSize: 16),
                      hintText: 'Add Caption ....',
                      border: InputBorder.none)),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: CircleAvatar(
              radius: 34,
              backgroundColor: Colors.black38,
              child: InkWell(
                onTap: () {
                  setState(() {
                    _controller.value.isPlaying
                        ? _controller.pause()
                        : _controller.play();
                  });
                },
                child: Icon(
                  _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                  color: Colors.white,
                  size: 50,
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
