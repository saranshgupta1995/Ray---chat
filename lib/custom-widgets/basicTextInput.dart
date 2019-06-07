import 'package:flutter/material.dart';

class _BasicTextInputState extends State<BasicTextInput> {
  final TextEditingController _textFieldController = TextEditingController();

  Widget build(BuildContext context) {
    return TextField(
        controller: _textFieldController,
        decoration: new InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          contentPadding: const EdgeInsets.all(10),
          hintText: widget.placeHolder ?? 'Some Placeholder',
          hintStyle: TextStyle(
            color: widget.placeHolderColor ?? widget.color ?? Colors.white
          )
        ),
        onChanged: (s) => widget.onChange(s),
        style: TextStyle(
          color: widget.color ?? Colors.white
        ),
      );
  }
}

class BasicTextInput extends StatefulWidget {
  final String placeHolder;
  final Color color;
  final Color placeHolderColor;
  final Function onChange;

  const BasicTextInput({Key key, this.placeHolder, this.onChange, this.color, this.placeHolderColor})
      : super(key: key);

  @override
  _BasicTextInputState createState() => _BasicTextInputState();
}