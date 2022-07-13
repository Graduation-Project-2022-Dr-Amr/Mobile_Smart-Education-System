import './user_model.dart';
import 'package:intl/intl.dart';

class Message {
  final User sender;
  final String time; // Would usually be type DateTime or Firebase Timestamp in production apps
  final String text;
  final bool isRead;

  Message({
    required this.sender,
    required this.time,
    required this.text,
    required this.isRead,
  });

  factory Message.fromMap(Map<dynamic, dynamic> map) {
    String _readTimestamp(int timestamp) {
      var now = DateTime.now();
      var format = DateFormat('HH:mm a');
      var date = DateTime.fromMicrosecondsSinceEpoch(timestamp * 1000);
      var diff = date.difference(now);
      var time = '';

      if (diff.inSeconds <= 0 ||
          diff.inSeconds > 0 && diff.inMinutes == 0 ||
          diff.inMinutes > 0 && diff.inHours == 0 ||
          diff.inHours > 0 && diff.inDays == 0) {
        time = format.format(date);
      } else {
        if (diff.inDays == 1) {
          time = diff.inDays.toString() + 'DAY AGO';
        } else {
          time = diff.inDays.toString() + 'DAYS AGO';
        }
      }

      return time;
    }

    return Message(
      sender: User.fromMap(map['sender'] as Map),
      time: _readTimestamp(int.parse(map['time'])),
      text: map['text'],
      isRead: map['isRead'],
    );
  }
}

// YOU - current user
final User currentUser = User(
  id: 1,
  name: 'Current User',
);

// USERS
final User greg = User(
  id: 1,
  name: 'Greg',
);
final User james = User(
  id: 2,
  name: 'James',
);
final User john = User(
  id: 3,
  name: 'John',
);
final User olivia = User(
  id: 4,
  name: 'Olivia',
);
final User sam = User(
  id: 5,
  name: 'Sam',
);
final User sophia = User(
  id: 6,
  name: 'Sophia',
);
final User steven = User(
  id: 7,
  name: 'Steven',
);

// FAVORITE CONTACTS
List<User> favorites = [sam, steven, olivia, john, greg];

// EXAMPLE CHATS ON HOME SCREEN
List<Message> chats = [
  Message(
    sender: james,
    time: '5:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isRead: true,
  ),
  Message(
    sender: olivia,
    time: '4:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isRead: true,
  ),
  Message(
    sender: john,
    time: '3:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isRead: false,
  ),
  Message(
    sender: sophia,
    time: '2:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isRead: true,
  ),
  Message(
    sender: steven,
    time: '1:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isRead: false,
  ),
  Message(
    sender: sam,
    time: '12:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isRead: false,
  ),
  Message(
    sender: greg,
    time: '11:30 AM',
    text: 'Hey, how\'s it going? What did you do today?',
    isRead: false,
  ),
];
