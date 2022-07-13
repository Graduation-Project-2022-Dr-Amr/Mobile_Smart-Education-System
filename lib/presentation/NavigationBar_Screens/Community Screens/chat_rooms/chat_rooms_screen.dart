import 'package:flutter/material.dart';

import 'recent_chats.dart';


class ChatRoomsScreen extends StatefulWidget {
  const ChatRoomsScreen({Key? key}) : super(key: key);

  @override
  State<ChatRoomsScreen> createState() => _ChatRoomsState();
}

class _ChatRoomsState extends State<ChatRoomsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 250, 251, 252),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Chat Rooms',
          style: TextStyle(fontSize: 16.0, color: Colors.black87),
        ),
        elevation: 0.0,
      ),
      body: RecentChats(),
    );
  }
}
