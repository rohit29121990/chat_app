import 'package:chat_app/screens/constents.dart';
import 'package:chat_app/screens/status/head_own_status.dart';
import 'package:chat_app/screens/status/other_status.dart';
import 'package:flutter/material.dart';

class StatusPage extends StatefulWidget {
  const StatusPage({Key? key}) : super(key: key);

  @override
  State<StatusPage> createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
          Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        SizedBox(
          height: 48,
          child: FloatingActionButton(
            elevation: 8,
            backgroundColor: Colors.blueGrey[100],
            onPressed: () {},
            child: Icon(
              Icons.edit,
              color: Colors.blueGrey[900],
            ),
          ),
        ),
        const SizedBox(height: 12),
        FloatingActionButton(
          backgroundColor: Colors.greenAccent[700],
          onPressed: () {},
          elevation: 4,
          child: const Icon(
            Icons.camera_alt,
          ),
        ),
      ]),
      body: SingleChildScrollView(
        child: Column(children: [
          const HeadOwnStatus(),
          label('Recent Updates'),
          const OtherStatus(
              imageName: flutter2, name: 'BalRam Rathor', time: '02:44'),
          const OtherStatus(
              imageName: flutter3, name: 'Asim Kumar', time: '02:43'),
          const OtherStatus(
              imageName: flutter4, name: 'Ram Singh', time: '02:03'),
          const OtherStatus(
              imageName: flutter5, name: 'Sumit Kumar', time: '02:43'),
          const SizedBox(height: 10),
          label('Viewes updates'),
          const OtherStatus(
              imageName: flutter1, name: 'Ashutosh Mishra', time: '02:43'),
          const OtherStatus(
              imageName: flutter2, name: 'Anjita pal', time: '02:43'),
        ]),
      ),
    );
  }

  Widget label(String label) {
    return Container(
      height: 33,
      width: MediaQuery.of(context).size.width,
      color: Colors.grey[300],
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 7),
      child: Text(
        label,
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
      ),
    );
  }
}
