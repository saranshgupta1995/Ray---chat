import 'package:flutter/material.dart';

class TicketDetails extends StatelessWidget {
  final data;

  const TicketDetails({this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Text(
              'Do you want to proceed with the cancellation?',
              style: TextStyle(fontSize: 14),
            ),
            Text('Ticket')
          ],
        ),
      ),
    );
  }
}
