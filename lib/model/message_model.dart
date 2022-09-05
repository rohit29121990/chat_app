import 'package:flutter/widgets.dart';

class MessageModel {
  MessageModel(
      {required this.message,
      required this.type,
      required this.time,
      required this.path});
  String type;
  String message;
  String time;
  String path;
}
