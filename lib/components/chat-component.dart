import 'package:flutter/material.dart';
import 'package:ray/components/bot-message.dart';
import 'package:ray/components/user-message.dart';

class _ChatWindowState extends State<ChatWindow> {
  final chatData = [
    {'n': 'S', 'message': 'Hi!!', 'type': 'bot', 'name': 'Saransh'},
    {'n': 'S', 'message': 'Hi!!', 'type': 'user', 'name': 'Saransh'},
  ];

  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        children: List.generate(chatData.length, (i) {
          if (chatData[i]['type'] == 'bot')
            return BotMessage(data: chatData[i]);
            else return UserMessage(data: chatData[i]);
        }),
      ),
    );
  }
}

class ChatWindow extends StatefulWidget {
  const ChatWindow({
    Key key,
  }) : super(key: key);

  @override
  _ChatWindowState createState() => _ChatWindowState();
}
