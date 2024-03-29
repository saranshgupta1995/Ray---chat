import 'package:flutter/material.dart';

class _UserMessageState extends State<UserMessage> {

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
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
            Column(
            children: <Widget>[
              new CircleAvatar(
                child: new Image.network("http://res.cloudinary.com/kennyy/image/upload/v1531317427/avatar_z1rc6f.png"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class UserMessage extends StatefulWidget {
  final data;

  const UserMessage({Key key, this.data}) : super(key: key);

  @override
  _UserMessageState createState() => _UserMessageState();
}
