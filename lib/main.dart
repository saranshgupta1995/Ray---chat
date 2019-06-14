import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'components/chat-component.dart';
import 'components/user-input-panel.dart';
import 'data/responses.dart';

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

  String getLastUserMessage(List<dynamic> list) {
    return list.reversed.firstWhere((x) => x['type'] == 'user')['message'];
  }

  Future getResponse() async {
    await Future.delayed(new Duration(milliseconds: 1000));
  }

  onSendToBot(e) {
    getResponse().then((x) {
      final String userMessage =
          (getLastUserMessage(widget.chatData).toLowerCase());
      final completeResponse = responsesData[userMessage] ?? {'type': ''};
      setState(() {
        final String respType = completeResponse['type'];
        respType.split(' ').forEach((type) {
          switch (type) {
            case 'text':
              widget.chatData.add({
                'n': 'R',
                'message': completeResponse[type] ?? 'Still need to study this',
                'type': 'bot',
                'name': 'Ray Bot'
              });
              break;
            case 'questions':
              widget.chatData.add({
                'n': 'R',
                'questions': completeResponse[type] ?? [],
                'type': type,
                'name': 'Ray Bot'
              });
              break;
            case 'ticket':
              widget.chatData.add({
                'n': 'R',
                'questions': completeResponse[type] ?? [],
                'type': type,
                'name': 'Ray Bot'
              });
              break;
            case 'cancel':
              widget.chatData.add({
                'n': 'R',
                'questions': completeResponse[type] ?? [],
                'type': type,
                'name': 'Ray Bot'
              });
              break;
            default:
          }
        });
        // widget.chatData.add({
        //   'n': 'R',
        //   'message': responses[userMessage] ?? 'Still need to study this',
        //   'type': 'bot',
        //   'name': 'Ray Bot'
        // });
        // widget.chatData.add({
        //   'n': 'R',
        //   'options': respondWithMoreOptions[userMessage] ?? [],
        //   'type': 'option',
        //   'name': 'Ray Bot'
        // });
        // widget.chatData.add({
        //   'n': 'R',
        //   'message': 'Pikachu',
        //   'type': 'ticket',
        //   'name': 'Ray Bot'
        // });
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
    onSendToBot(x);
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
