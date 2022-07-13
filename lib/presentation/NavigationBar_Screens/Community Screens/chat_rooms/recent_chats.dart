import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'models/message_model.dart';
import './chat/chat_screen.dart';
import 'models/user_model.dart';

class RecentChats extends StatelessWidget {
  DatabaseReference roomRef = FirebaseDatabase.instance.ref('rooms');

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DatabaseEvent>(
        stream: roomRef.onValue,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data as DatabaseEvent, rooms = data.snapshot.children.toList().reversed.toList();

            return rooms.isEmpty
                ? Center(
                    child: Column(children: [
                      Text('You have not started any chat'),
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => ChatScreen(
                                    user: User(
                                      id: 1,
                                      name: 'Current User',
                                    ),
                                    room: '2-3',
                                  ),
                                ));
                          },
                          icon: Icon(Icons.add))
                    ]),
                  )
                : ListView.builder(
                    itemCount: rooms.length,
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      final room = rooms[index];

                      return FutureBuilder<DataSnapshot>(
                          future: room.ref.limitToLast(1).get(),
                          builder: (ctx, snap) {
                            if (snap.hasData) {
                              final Message message = Message.fromMap(snap.data!.children.last.value as Map);

                              return GestureDetector(
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => ChatScreen(
                                      user: message.sender,
                                      room: room.key.toString(),
                                    ),
                                  ),
                                ),
                                child: Container(
                                  margin: EdgeInsets.only(top: 5.0, bottom: 5.0, right: 20.0),
                                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey.shade100),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20.0),
                                      bottomRight: Radius.circular(20.0),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          CircleAvatar(
                                            radius: 35.0,
                                            backgroundColor: Colors.grey.shade100,
                                            backgroundImage: NetworkImage(
                                                'https://static.vecteezy.com/system/resources/previews/005/545/335/original/user-sign-icon-person-symbol-human-avatar-isolated-on-white-backogrund-vector.jpg'),
                                          ),
                                          SizedBox(width: 10.0),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                message.sender.name,
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(height: 5.0),
                                              SizedBox(
                                                width: MediaQuery.of(context).size.width * 0.5,
                                                child: Text(
                                                  message.text,
                                                  style: TextStyle(
                                                    color: Colors.blueGrey,
                                                    fontSize: 12.0,
                                                  ),
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: <Widget>[
                                          Text(
                                            message.time,
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 10.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 5.0),
                                          !message.isRead && message.sender.id != currentUser.id
                                              ? Container(
                                                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                                  decoration: BoxDecoration(
                                                    color: Theme.of(context).primaryColor,
                                                    borderRadius: BorderRadius.circular(30.0),
                                                  ),
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    'NEW',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 8.0,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                )
                                              : Text(''),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            } else {
                              return Container();
                            }
                          });
                    },
                  );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
