import 'package:flutter/material.dart';

class _OptionMessageState extends State<OptionMessage> {
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        children: List.generate(widget.data['options'].length, (i) {
          return InkWell(
            onTap: ()=>widget.onOptionClick(widget.data['options'][i]),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(5)),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Text(
                  widget.data['options'][i],
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class OptionMessage extends StatefulWidget {
  final data;
  final onOptionClick;

  const OptionMessage({Key key, this.data, this.onOptionClick})
      : super(key: key);

  @override
  _OptionMessageState createState() => _OptionMessageState();
}
