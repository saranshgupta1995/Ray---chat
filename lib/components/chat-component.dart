import 'package:flutter/material.dart';
import 'package:ray/components/bot-message.dart';
import 'package:ray/components/user-message.dart';

class _ChatWindowState extends State<ChatWindow> {
  final typeMapping = {
    'bot': BotMessage,
    'user': UserMessage,
  };

  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        children: List.generate(widget.chatData.length, (i) {
          switch (widget.chatData[i]['type']) {
            case 'bot':
              return BotMessage(data: widget.chatData[i]);
              break;
            case 'user':
              return UserMessage(data: widget.chatData[i]);
              break;
            default:
          }
        }),
      ),
    );
  }
}

class ChatWindow extends StatefulWidget {
  final chatData;

  const ChatWindow({Key key, this.chatData}) : super(key: key);

  @override
  _ChatWindowState createState() => _ChatWindowState();
}
