import 'package:chat_app/model/chat_model.dart';
import 'package:chat_app/screens/camera/camera_page.dart';
import 'package:chat_app/screens/chat/chat_page.dart';
import 'package:flutter/material.dart';

import 'constents.dart';
import 'status/status_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.chatModels, required this.sourceChat})
      : super(key: key);
  final List<ChatModel> chatModels;
  final ChatModel sourceChat;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Whatsapp Clone'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          // IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          popupMenusHome
        ],
        bottom: TabBar(
          indicatorColor: Colors.white,
          controller: _tabController,
          tabs: const [
            Tab(
              icon: Icon(Icons.camera_alt),
            ),
            Tab(text: "CHATS"),
            Tab(text: "STATUS"),
            Tab(text: "CALLS"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          const CamereaPage(),
          ChatPage(
              chatModels: widget.chatModels, sourceChat: widget.sourceChat),
          const StatusPage(),
          const Text('Call')
        ],
      ),
    );
  }
}
