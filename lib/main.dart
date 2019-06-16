import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';

import 'components/chat-component.dart';
import 'components/user-input-panel.dart';
import 'data/responses.dart';

void main() {
  // debugPaintSizeEnabled = true;
  runApp(MyApp());
}

final upcoming = [
  {
    'id': 1,
    'src': 'Bangalore',
    'dest': 'Chennai',
    'tripTime': 'Friday, 7 Jun 2019, 09:15 PM',
    'travelName': 'DreamLiner Travels',
    'bp': 'Indra Nagar'
  },
  {
    'id': 2,
    'src': 'Chennai',
    'dest': 'Bangalore',
    'tripTime': 'Sunday, 9 Jun 2019, 09:15 PM',
    'travelName': 'DreamLiner Travels',
    'bp': 'Koyembedu'
  }
];

final List<Map<dynamic, dynamic>> chatData = [];

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
        chatData: chatData,
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

  removeTicket(t) {
    setState(() {
      upcoming.removeWhere((x) {
        return x['id'] == t;
      });
    });
  }

  ScrollController _chatListScrollController = new ScrollController();

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
          SchedulerBinding.instance.addPostFrameCallback((_) {
            _chatListScrollController.animateTo(
                _chatListScrollController.position.maxScrollExtent,
                curve: Curves.ease,
                duration: const Duration(milliseconds: 200));
          });
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
                scrollController: _chatListScrollController,
                removeTickets: removeTicket,
                chatData: widget.chatData,
                onOptionClick: onOptionClick,
                tickets: upcoming),
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
