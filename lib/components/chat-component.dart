import 'package:flutter/material.dart';
import 'package:ray/components/bot-message.dart';
import 'package:ray/components/option-list.dart';
import 'package:ray/components/ticket-list.dart';
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
            case 'ticket':
              return TicketMessage(data: widget.chatData[i]);
              break;
            case 'option':
              return OptionMessage(data: widget.chatData[i],onOptionClick: widget.onOptionClick);
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
  final onOptionClick;

  const ChatWindow({Key key, this.chatData, this.onOptionClick}) : super(key: key);

  @override
  _ChatWindowState createState() => _ChatWindowState();
}
