import 'package:flutter/material.dart';
import 'package:ray/custom-widgets/basicTextInput.dart';

class _UserInputPanelState extends State<UserInputPanel> {
  String userInput = '';

  onTextChange(e) {
    userInput = e;
  }

  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              BasicTextInput(
                textValue: userInput,
                color: widget.textColor,
                placeHolderColor: widget.placeHolderColor,
                placeHolder: widget.placeHolder,
                onChange: onTextChange,
                disabled: widget.disabled,
                autofocus: true,
              ),
            ],
          ),
        ),
        Column(
          children: <Widget>[
            FlatButton(
              onPressed: widget.disabled
                  ? null
                  : () {
                      widget.onSend(userInput);
                      onTextChange('');
                    },
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
  final bool disabled;

  const UserInputPanel(
      {Key key,
      this.placeHolder,
      this.onChange,
      this.disabled,
      this.textColor,
      this.placeHolderColor,
      this.onSend,
      this.buttonText})
      : super(key: key);

  @override
  _UserInputPanelState createState() => _UserInputPanelState();
}
