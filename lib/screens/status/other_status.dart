import 'package:chat_app/screens/constents.dart';
import 'package:flutter/material.dart';

class OtherStatus extends StatelessWidget {
  const OtherStatus(
      {Key? key,
      required this.imageName,
      required this.name,
      required this.time})
      : super(key: key);
  final String name;
  final String time;
  final String imageName;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 26,
        backgroundImage: AssetImage(imageName),
      ),
      title: Text(
        name,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
      subtitle: Text(
        'Today at, $time',
        style: TextStyle(fontSize: 14, color: Colors.grey[900]),
      ),
    );
  }
}
