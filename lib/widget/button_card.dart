import 'package:chat_app/screens/constents.dart';
import 'package:flutter/material.dart';

class ButtonCard extends StatelessWidget {
  ButtonCard(
      {Key? key, required this.name, required this.icon, required this.onTap})
      : super(key: key);
  final String name;
  final IconData icon;
  Function onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => onTap(),
      leading: CircleAvatar(
        radius: 22,
        child: Icon(icon, color: Colors.white),
        backgroundColor: lightGreen,
      ),
      title: Text(
        name,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      ),
    );
  }
}
