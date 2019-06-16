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
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Do you want to proceed with the cancellation?',
              style: TextStyle(fontSize: 16),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                  'Journey details : ${data['bp']} (${data['src']}) - ${data['dest']}'),
            ),
            Text('Cancellation charges : 0 INR')
          ],
        ),
      ),
    );
  }
}
