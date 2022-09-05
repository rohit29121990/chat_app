import 'dart:math';

import 'package:chat_app/screens/camera/view/camera_view.dart';
import 'package:chat_app/screens/camera/view/video_view.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

late List<CameraDescription> cameras;

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key, required this.onImageSend}) : super(key: key);
  final Function onImageSend;
  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _cameraController;
  late Future<void> cameraValue;
  late XFile filePath;
  bool isRecording = false;
  bool flash = false;
  bool isCameraFront = true;
  double trannsform = 0;

  @override
  void initState() {
    super.initState();

    _cameraController = CameraController(cameras[0], ResolutionPreset.max);
    cameraValue = _cameraController.initialize();

    cameraValue.then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            print('User denied camera access.');
            break;
          default:
            print('Handle other errors.');
            break;
        }
      }
    });
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        FutureBuilder(
            future: cameraValue,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: CameraPreview(_cameraController),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),
        Positioned(
          bottom: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 14),
            color: Colors.black,
            width: MediaQuery.of(context).size.width,
            child: Column(children: [
              Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          flash = !flash;
                        });
                        flash
                            ? _cameraController.setFlashMode(FlashMode.torch)
                            : _cameraController.setFlashMode(FlashMode.off);
                      },
                      icon: flash
                          ? const Icon(
                              Icons.flash_on,
                              color: Colors.white,
                              size: 28,
                            )
                          : const Icon(
                              Icons.flash_off,
                              color: Colors.white,
                              size: 28,
                            ),
                    ),
                    GestureDetector(
                        onLongPress: () {
                          startVideo(context);
                        },
                        onLongPressUp: () {
                          stopVideo(context);
                        },
                        onTap: () {
                          if (!isRecording) takePhoto(context);
                        },
                        child: isRecording
                            ? const Icon(Icons.radio_button_on,
                                color: Colors.red, size: 80)
                            : const Icon(Icons.panorama_fish_eye,
                                color: Colors.white, size: 72)),
                    IconButton(
                      onPressed: () async {
                        setState(() {
                          isCameraFront = !isCameraFront;
                          trannsform = trannsform + pi;
                        });
                        int cameraPos = isCameraFront ? 0 : 1;

                        _cameraController = CameraController(
                            cameras[cameraPos], ResolutionPreset.max);
                        cameraValue = _cameraController.initialize();
                      },
                      icon: Transform.rotate(
                        angle: trannsform,
                        child: const Icon(Icons.flip_camera_ios,
                            color: Colors.white, size: 28),
                      ),
                    ),
                  ]),
              const SizedBox(height: 4),
              const Text(
                'Hold for video,tap for photo',
                style: TextStyle(color: Colors.white),
              )
            ]),
          ),
        )
      ]),
    );
  }

  takePhoto(BuildContext context) async {
    filePath = await _cameraController.takePicture();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CameraViewPage(
                  path: filePath.path,
                  onImageSend: widget.onImageSend,
                )));
  }

  stopVideo(BuildContext context) async {
    filePath = await _cameraController.stopVideoRecording();
    setState(() => isRecording = false);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VideoViewPage(path: filePath.path),
      ),
    );
  }

  startVideo(BuildContext context) async {
    await _cameraController.startVideoRecording();
    setState(() => isRecording = true);
  }
}
