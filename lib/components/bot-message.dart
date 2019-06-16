import 'package:flutter/material.dart';

class _BotMessageState extends State<BotMessage> {

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              new CircleAvatar(
                child: new Image.network("http://res.cloudinary.com/kennyy/image/upload/v1531317427/avatar_z1rc6f.png"),
              )
            ],
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Text(
                    widget.data['name'],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Text(widget.data['message']),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BotMessage extends StatefulWidget {
  final data;

  const BotMessage({Key key, this.data}) : super(key: key);

  @override
  _BotMessageState createState() => _BotMessageState();
}
