import 'package:flutter/material.dart';
import 'package:ray/components/bot-message.dart';
import 'package:ray/components/user-message.dart';

class _ChatWindowState extends State<ChatWindow> {
  final chatData = [
    {'n': 'S', 'message': 'Hi!!', 'type': 'bot', 'name': 'Saransh'},
    {'n': 'S', 'message': 'Hi!!', 'type': 'user', 'name': 'Saransh'},
    {'n': 'S', 'message': 'How are you??', 'type': 'bot', 'name': 'Saransh'},
    {'n': 'S', 'message': 'Great, wbu?', 'type': 'user', 'name': 'Saransh'},
    {'n': 'S', 'message': 'Hi!!', 'type': 'bot', 'name': 'Saransh'},
    {'n': 'S', 'message': 'Hi!!', 'type': 'user', 'name': 'Saransh'},
    {'n': 'S', 'message': 'How are you??', 'type': 'bot', 'name': 'Saransh'},
    {'n': 'S', 'message': 'Great, wbu?', 'type': 'user', 'name': 'Saransh'},
    {'n': 'S', 'message': 'Hi!!', 'type': 'bot', 'name': 'Saransh'},
    {'n': 'S', 'message': 'Hi!!', 'type': 'user', 'name': 'Saransh'},
    {'n': 'S', 'message': 'How are you??', 'type': 'bot', 'name': 'Saransh'},
    {'n': 'S', 'message': 'Great, wbu?', 'type': 'user', 'name': 'Saransh'},
    {'n': 'S', 'message': 'Hi!!', 'type': 'bot', 'name': 'Saransh'},
    {'n': 'S', 'message': 'Hi!!', 'type': 'user', 'name': 'Saransh'},
    {'n': 'S', 'message': 'How are you??', 'type': 'bot', 'name': 'Saransh'},
    {'n': 'S', 'message': 'Great, wbu?', 'type': 'user', 'name': 'Saransh'},
    {'n': 'S', 'message': 'Hi!!', 'type': 'bot', 'name': 'Saransh'},
    {'n': 'S', 'message': 'Hi!!', 'type': 'user', 'name': 'Saransh'},
    {'n': 'S', 'message': 'How are you??', 'type': 'bot', 'name': 'Saransh'},
    {'n': 'S', 'message': 'Great, wbu?', 'type': 'user', 'name': 'Saransh'},
  ];

  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        children: List.generate(widget.chatData.length, (i) {
          if (widget.chatData[i]['type'] == 'bot')
            return BotMessage(data: widget.chatData[i]);
            else return UserMessage(data: widget.chatData[i]);
        }),
      ),
    );
  }
}

class ChatWindow extends StatefulWidget {

  final chatData;

  const ChatWindow({
    Key key, this.chatData
  }) : super(key: key);

  @override
  _ChatWindowState createState() => _ChatWindowState();
}
