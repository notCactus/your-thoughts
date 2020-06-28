import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  final String message;
  final String image;

  const Message({
    Key key,
    this.message,
    this.image = 'Flutter Logo',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      elevation: 4,
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        leading: Container(
          child: FlutterLogo(
            size: 32,
          ),
        ),
        title: Text(message),
      ),
    );
  }
}
