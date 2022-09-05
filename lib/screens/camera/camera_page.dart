import 'package:flutter/material.dart';

import 'camera_screen.dart';

class CamereaPage extends StatelessWidget {
  const CamereaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CameraScreen(
      onImageSend: () {},
    );
  }
}
