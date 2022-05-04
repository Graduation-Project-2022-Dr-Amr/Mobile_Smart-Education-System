import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:smart_education/Screens/chat_rooms/models/message_model.dart';
import 'package:smart_education/Screens/chat_rooms/models/user_model.dart';

class ChatScreen extends StatefulWidget {
  final User user;

  const ChatScreen({required this.user});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  DatabaseReference ref = FirebaseDatabase.instance.ref();

  @override
  void initState() {
    super.initState();
    _doOperation();
  }

  _doOperation() async {
    final newUser = {
      'id': '3',
      'name': 'Test',
    };

    final userRef = ref.child('users').push();

    return userRef.set(newUser);
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
                child: FutureBuilder(
                    future: _getMessages(),
                    builder: (ctx, snapshot) {
                      if (snapshot.hasData) {
                        final data = snapshot.data as DataSnapshot,
                            messages =
                                data.children.map((e) => Message.fromMap(e.value as Map)).toList().reversed.toList();

                        return ListView.builder(
                          physics: BouncingScrollPhysics(),
                          reverse: true,
                          padding: EdgeInsets.only(top: 15.0),
                          itemCount: messages.length,
                          itemBuilder: (BuildContext context, int index) {
                            final Message message = messages[index];
                            final bool isMe = message.sender.id == currentUser.id;
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
      margin: isMe
          ? EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
              left: 80.0,
            )
          : EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
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
              textCapitalization: TextCapitalization.sentences,
              onChanged: (value) {},
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
    final roomId = 'rooms/1-2';
    final newMessage = {
      'sender': {
        'id': 1,
        'name': 'Hoda',
      },
      'text': 'This is a test message',
      'time': DateTime.now().millisecondsSinceEpoch.toString(),
      'isRead': false,
    };

    final messagesRef = ref.child(roomId).push();

    return messagesRef.set(newMessage);
  }

  _getMessages() async {
    return ref.child('rooms/1-2').get();
  }
}
