import 'package:flutter/material.dart';

import '../widgets/message.dart';
import '../models/message.dart' as msg;
import '../widgets/send_message.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<msg.Message> _messages = [
    msg.Message(
        message:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In vehicula blandit sapien bibendum gravida. Suspendisse aliquet molestie nulla. Vestibulum fermentum libero ac turpis faucibus aliquet vel dictum mauris. Dio scelerisque in. Phasellus nisl nunc, posuere vitae scelerisque.',
        image: 'Image'),
    msg.Message(
      message: 'This is a test message.',
      image: 'Image',
    ),
  ];

  void addMessage(String text) {
    if (text != '') {
      setState(() {
        _messages.add(
          msg.Message(message: text, image: 'Image'),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('YourThoughts'),
      ),
      body: Container(
        margin: EdgeInsets.only(bottom: 56),
        child: ListView.builder(
          itemCount: _messages.length,
          itemBuilder: (context, i) => Message(
            message: _messages[i].message,
          ),
        ),
      ),
      bottomSheet: SendMessage(
        msgFunction: addMessage,
      ),
    );
  }
}
