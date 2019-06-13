import 'package:flutter/material.dart';

class _QuestionMessageState extends State<QuestionMessage> {
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: List.generate(widget.data['questions'].length, (i) {
          return InkWell(
              onTap: () => widget.onOptionClick(widget.data['questions'][i]),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(5)),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: Text(
                          widget.data['questions'][i],
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ),
                  )
                ],
              ));
        }),
      ),
    );
  }
}

class QuestionMessage extends StatefulWidget {
  final data;
  final onOptionClick;

  const QuestionMessage({Key key, this.data, this.onOptionClick})
      : super(key: key);

  @override
  _QuestionMessageState createState() => _QuestionMessageState();
}
