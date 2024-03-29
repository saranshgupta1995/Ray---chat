import 'package:flutter/material.dart';
import 'package:ray/components/ticket-details.dart';

class _TicketCancelState extends State<TicketCancel> {
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        children: List.generate(widget.data.length, (index) {
          return InkWell(
            onTap: () => showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title:
                        Text('Do you want to proceed with the cancellation?'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                            '${widget.data[index]['bp']} (${widget.data[index]['src']}) - ${widget.data[index]['dest']}'),
                        Text('Cancellation charges : 0 INR'),
                        Text('Press Confirm to cancel the booking'),
                      ],
                    ),
                    actions: <Widget>[
                      new FlatButton(
                        child: Text('Cancel'),
                        onPressed: ()=>Navigator.of(context).pop(),
                      ),
                      new FlatButton(
                        child: Text('Confirm'),
                        onPressed: (){
                          widget.removeTickets(widget.data[index]['id']);
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                }),
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => TicketDetails(data:widget.data[index]))),
            child: new Card(
              // color: Colors.blue[index * 100],
              child: new Padding(
                padding: EdgeInsets.all(10),
                child: new Container(
                  width: MediaQuery.of(context).size.width - 50,
                  height: 130.0,
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
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
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
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "${widget.data[index]['bp']}",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Text(
                              "Cancel",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: <Widget>[],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class TicketCancel extends StatefulWidget {
  final data;
  final removeTickets;

  const TicketCancel({Key key, this.data, this.removeTickets}) : super(key: key);

  @override
  _TicketCancelState createState() => _TicketCancelState();
}
