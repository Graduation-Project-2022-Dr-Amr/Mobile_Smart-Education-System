import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../models/message_model.dart';
import '../models/user_model.dart';

class ChatScreen extends StatefulWidget {
  final User user;
  final String room;
  const ChatScreen({Key? key, required this.user, required this.room}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  DatabaseReference ref = FirebaseDatabase.instance.ref();
  final _messageController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 249, 249, 248),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(color: Colors.black87),
        title: Text(
          widget.user.name,
          style: TextStyle(fontSize: 16.0, color: Colors.black87),
        ),
        elevation: 0.0,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: StreamBuilder(
                    stream: _getMessages(),
                    builder: (ctx, snapshot) {
                      if (snapshot.hasData) {
                        final data = snapshot.data as DatabaseEvent,
                            messages = data.snapshot.children
                                .map((e) => Message.fromMap(e.value as Map))
                                .toList()
                                .reversed
                                .toList();
                        return messages.isEmpty
                            ? Center(
                                child: Text('No messages yet, you could be the first one'),
                              )
                            : ListView.builder(
                                physics: BouncingScrollPhysics(),
                                reverse: true,
                                padding: EdgeInsets.only(top: 15.0),
                                itemCount: messages.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final Message message = messages[index];
                                  final bool isMe = message.sender.id == currentUser.id;

                                  // if (!isMe) _updateLastMessage();

                                  return _buildMessage(message, isMe);
                                },
                              );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
              ),
            ),
            _buildMessageComposer(),
          ],
        ),
      ),
    );
  }

  _buildMessage(Message message, bool isMe) {
    final Container msg = Container(
      margin: EdgeInsets.only(
        top: 5.0,
        bottom: 5.0,
        left: isMe ? 80.0 : 0.0,
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      width: MediaQuery.of(context).size.width * 0.75,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade100),
          color: isMe ? Color.fromARGB(255, 70, 126, 255) : Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            message.text,
            style: TextStyle(
              color: !isMe ? Colors.black87 : Colors.white,
              fontSize: 12.0,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            message.time,
            style: TextStyle(
              color: !isMe ? Colors.black54 : Colors.white54,
              fontSize: 10.0,
            ),
          ),
        ],
      ),
    );
    if (isMe) {
      return msg;
    }
    return Row(
      children: <Widget>[msg],
    );
  }

  _buildMessageComposer() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      height: 50.0,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.photo),
            iconSize: 16.0,
            color: Theme.of(context).primaryColor,
            onPressed: () {},
          ),
          Expanded(
            child: TextField(
              controller: _messageController,
              textCapitalization: TextCapitalization.sentences,
              onChanged: (value) {},
              onSubmitted: (_) => _onSendMessage(),
              decoration: InputDecoration.collapsed(
                hintText: 'Send a message...',
                hintStyle: TextStyle(fontSize: 12),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            iconSize: 16.0,
            color: Theme.of(context).primaryColor,
            onPressed: _onSendMessage,
          ),
        ],
      ),
    );
  }

  void _onSendMessage() async {
    if (_messageController.text.isEmpty) return;

    final newMessage = {
      'sender': {
        'id': 1,
        'name': 'Hoda',
      },
      'text': _messageController.text,
      'time': DateTime.now().millisecondsSinceEpoch.toString(),
      'isRead': false,
    };

    final messagesRef = FirebaseDatabase.instance.ref().child(_roomName).push();
    _resetMessage();
    return messagesRef.set(newMessage);
  }

  void _updateLastMessage() async {
    final chats = await FirebaseDatabase.instance.ref().child(_roomName).child(_roomName).get();
    final lastMessage =
        FirebaseDatabase.instance.ref().child(_roomName).child(_roomName).child(chats.children.last.key.toString());
    return lastMessage.update({'isRead': true});
  }

  Stream<DatabaseEvent> _getMessages() {
    return FirebaseDatabase.instance.ref().child(_roomName).orderByChild('time').onValue;
  }

  void _resetMessage() {
    _messageController.clear();
  }

  get _roomName {
    return 'rooms/${widget.room}';
  }
}
