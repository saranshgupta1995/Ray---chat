import 'package:flutter/material.dart';

class _TicketMessageState extends State<TicketMessage> {
  Widget build(BuildContext context) {
    return Container(
      height: 140,
        child: ListView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          children: List.generate(2, (i) {
            return Card(
              child: Container(
                width: 300,
                child: Text('data'),
              ),
            );
          }),
        ),
      );
  }
}

class TicketMessage extends StatefulWidget {
  final data;

  const TicketMessage({Key key, this.data}) : super(key: key);

  @override
  _TicketMessageState createState() => _TicketMessageState();
}
