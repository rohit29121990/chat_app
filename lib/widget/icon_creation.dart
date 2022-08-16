import 'package:flutter/material.dart';

class IconCreation extends StatelessWidget {
  IconCreation(
      {Key? key, required this.color, required this.icon, required this.title})
      : super(key: key);
  IconData icon;
  Color color;
  String title;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Column(children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: color,
          child: Icon(
            icon,
            size: 28,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: const TextStyle(fontSize: 12),
        )
      ]),
    );
  }
}
