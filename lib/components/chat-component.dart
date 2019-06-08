import 'package:flutter/material.dart';

class _ChatWindowState extends State<ChatWindow> {
  final chatData = [
    {'n': 'S', 'message': 'Hi!!', 'type': 'bot', 'name': 'Saransh'},
    {'n': 'S', 'message': 'Hi!!', 'type': 'bot', 'name': 'Saransh'},
  ];

  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        children: List.generate(chatData.length, (i) {
          if (chatData[i]['type'] == 'bot')
            return Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              // elevation: 0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        // height: 50,
                        // width: 50,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          // borderRadius: BorderRadius.circular(10)
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text(chatData[i]['n']),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Text(
                            chatData[i]['name'],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Text(chatData[i]['message']),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
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
