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
      home: MyHomePage(
        title: 'Ray',
        chatData: [],
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.chatData}) : super(key: key);

  final String title;
  List<Map> chatData;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isBotTyping = false;

  Future getResponse() async {
    await Future.delayed(new Duration(milliseconds: 1000));
  }

  onSendToBot(e) {
    getResponse().then((x) {
      setState(() {
        widget.chatData.add({
          'n': 'R',
          'options': [
            'Hi',
            'My Name is',
            'Slim',
            'Shady.',
            'and the real',
            'slim',
            'shady',
            'will stand up.'
          ],
          'type': 'option',
          'name': 'Ray Bot'
        });
        isBotTyping = false;
      });
    });

    setState(() {
      widget.chatData
          .add({'n': 'S', 'message': e, 'type': 'user', 'name': 'Saransh'});

      isBotTyping = true;
    });
  }

  onOptionClick(x) {
    print(x);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            ChatWindow(
              chatData: widget.chatData,
              onOptionClick: onOptionClick,
            ),
            UserInputPanel(
              textColor: Colors.black87,
              placeHolderColor: Colors.black45,
              placeHolder: 'Start Typing..',
              buttonText: 'Send',
              onSend: onSendToBot,
              disabled: isBotTyping,
            )
          ],
        ));
  }
}
