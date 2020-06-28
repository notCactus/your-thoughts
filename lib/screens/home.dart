import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../widgets/message.dart';
import '../models/message.dart' as msg;
import '../widgets/send_message.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<msg.Message> _messages = [];

  void silentAddMessage(String text) {
    if (text != '') {
      _messages.add(
        msg.Message(message: text, image: 'Image'),
      );
    }
  }

  void addMessage(String text) {
    if (text != '') {
      setState(() {
        _messages.add(
          msg.Message(message: text, image: 'Image'),
        );
      });
      Firestore.instance.collection('messages').add({'message': text});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('YourThoughts'),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance.collection('messages').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Text('Loading...');
              default:
                _messages = snapshot.data.documents
                    .map(
                      (d) => msg.Message(message: d['message'], image: 'Image'),
                    )
                    .toList();
                return Container(
                  margin: EdgeInsets.only(bottom: 56),
                  child: ListView.builder(
                    itemCount: _messages.length,
                    itemBuilder: (context, i) => Message(
                      message: _messages[i].message,
                    ),
                  ),
                );
            }
          }),
      bottomSheet: SendMessage(
        msgFunction: addMessage,
      ),
    );
  }
}
