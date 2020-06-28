import 'package:flutter/material.dart';

import '../widgets/message.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('YourThoughts'),
      ),
      body: ListView(children: <Widget>[
        Message(),
        Message(),
        Message(),
        Message(),
        Message(),
        Message(),
      ]),
    );
  }
}
