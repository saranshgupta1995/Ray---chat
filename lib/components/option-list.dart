import 'package:flutter/material.dart';

class _OptionMessageState extends State<OptionMessage> {
  Widget build(BuildContext context) {
    return Container(
      height: 35,
        child: ListView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          children: List.generate(2, (i) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(6)
              ),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Text('data', style: TextStyle(
                  fontSize: 15
                ),),
              ),
            );
          }),
        ),
      );
  }
}

class OptionMessage extends StatefulWidget {
  final data;

  const OptionMessage({Key key, this.data}) : super(key: key);

  @override
  _OptionMessageState createState() => _OptionMessageState();
}
