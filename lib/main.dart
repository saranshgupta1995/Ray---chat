import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:location/location.dart';

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

  scrollToBottom(ScrollController scroller) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      scroller.animateTo(scroller.position.maxScrollExtent,
          curve: Curves.ease, duration: const Duration(milliseconds: 200));
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
            case 'final':
              widget.chatData.add({
                'n': 'R',
                'questions': completeResponse[type] ?? [],
                'type': type,
                'name': 'Ray Bot'
              });
              break;
            default:
          }
          scrollToBottom(_chatListScrollController);
        });
        isBotTyping = false;
      });
    });

    setState(() {
      widget.chatData
          .add({'n': 'S', 'message': e, 'type': 'user', 'name': 'Saransh'});

      isBotTyping = true;
    });

    scrollToBottom(_chatListScrollController);
  }

  onOptionClick(x) {
    onSendToBot(x);
  }

  @override
  Widget build(BuildContext context) {

    if(chatData.length==0){
      onSendToBot('Hi');
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text(widget.title),
        ),
        body: GetLocationPage());
  }
}

class GetLocationPage extends StatefulWidget {
  @override
  _GetLocationPageState createState() => _GetLocationPageState();
}

class _GetLocationPageState extends State<GetLocationPage> {

  var location = new Location();
  Map<String, double> currentLocation;
  Map<String, double> userLocation;

  void initState() {
    // TODO: implement initState
    super.initState();
    location.onLocationChanged().listen((value) {
      setState(() {
        currentLocation = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            currentLocation == null
                ? CircularProgressIndicator()
                : Text("Location:" +
                    currentLocation["latitude"].toString() +
                    " " +
                    currentLocation["longitude"].toString()),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: () {
                  _getLocation().then((value) {
                    setState(() {
                      userLocation = value;
                    });
                  });
                },
                color: Colors.blue,
                child: Text("Get Location", style: TextStyle(color: Colors.white),),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<Map<String, double>> _getLocation() async {
    var currentLocation = <String, double>{};
    try {
      currentLocation = await location.getLocation();
    } catch (e) {
      currentLocation = null;
    }
    return currentLocation;
  }
}

