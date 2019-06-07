import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'components/chat-component.dart';
import 'components/user-input-panel.dart';

void main() {
  // debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'redBus Ray',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Ray'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            ChatWindow(),
            UserInputPanel(
              textColor: Colors.black87,
              placeHolderColor: Colors.black45,
              placeHolder: 'Start Typing..',
              buttonText: 'Send',
            )
          ],
        ));
  }
}
