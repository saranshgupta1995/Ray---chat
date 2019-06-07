import 'package:flutter/material.dart';
import 'package:ray/custom-widgets/basicTextInput.dart';

class _UserInputPanelState extends State<UserInputPanel> {
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              BasicTextInput(
                color: widget.textColor,
                placeHolderColor: widget.placeHolderColor,
                placeHolder: widget.placeHolder,
              ),
            ],
          ),
        ),
        Column(
          children: <Widget>[
            FlatButton(
              onPressed: null,
              child: Text(widget.buttonText),
            )
          ],
        )
      ],
    );
  }
}

class UserInputPanel extends StatefulWidget {
  final String placeHolder;
  final String buttonText;
  final Color textColor;
  final Color placeHolderColor;
  final Function onChange;
  final Function onSend;

  const UserInputPanel(
      {Key key,
      this.placeHolder,
      this.onChange,
      this.textColor,
      this.placeHolderColor,
      this.onSend,
      this.buttonText})
      : super(key: key);

  @override
  _UserInputPanelState createState() => _UserInputPanelState();
}