import 'package:flutter/material.dart';
import 'package:ray/components/bot-message.dart';
import 'package:ray/components/user-message.dart';

class _ChatWindowState extends State<ChatWindow> {

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
