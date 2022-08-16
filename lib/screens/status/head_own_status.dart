import 'package:chat_app/screens/constents.dart';
import 'package:flutter/material.dart';

class HeadOwnStatus extends StatefulWidget {
  const HeadOwnStatus({Key? key}) : super(key: key);

  @override
  State<HeadOwnStatus> createState() => _HeadOwnStatusState();
}

class _HeadOwnStatusState extends State<HeadOwnStatus> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Stack(
        children: [
          const CircleAvatar(
            radius: 28,
            backgroundColor: Colors.white,
            backgroundImage: AssetImage(flutter1),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: CircleAvatar(
                radius: 10,
                backgroundColor: Colors.greenAccent[700],
                child: const Icon(
                  Icons.add,
                  size: 20,
                  color: Colors.white,
                )),
          )
        ],
      ),
      title: const Text(
        'My Status',
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      ),
      subtitle: Text(
        'Tap to add status update',
        style: TextStyle(fontSize: 12, color: Colors.grey[900]),
      ),
    );
  }
}
