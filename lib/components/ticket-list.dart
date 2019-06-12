import 'package:flutter/material.dart';

class TicketDetails extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'redBus Ray',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Ticket 123123'),
        ),
        body: Text('Heyo'),
      ),
    );
  }
}

class _TicketMessageState extends State<TicketMessage> {
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        children: List.generate(2, (i) {
          return InkWell(
            onTap: () => null,
            child: Card(
              child: Container(
                width: 300,
                child: Padding(
                  child: Text('data'),
                  padding: EdgeInsets.all(10),
                ),
              ),
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
