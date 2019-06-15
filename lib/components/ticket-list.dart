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
      height: 120,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        children: List.generate(widget.data.length, (index) {
          return InkWell(
            onTap: () => null,
            child: new Card(
              // color: Colors.blue[index * 100],
              child: new Padding(
                padding: EdgeInsets.all(10),
                child: new Container(
                    width: MediaQuery.of(context).size.width - 50,
                    height: 120.0,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                            decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Colors.black26)),
                            ),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text(
                                      "${widget.data[index]['src']} - ${widget.data[index]['dest']}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      "${widget.data[index]['tripTime']}",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text(
                                      "${widget.data[index]['travelName']}",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      "${widget.data[index]['bp']}",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
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
