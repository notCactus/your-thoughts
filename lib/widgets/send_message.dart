import 'package:flutter/material.dart';

class SendMessage extends StatelessWidget {
  final Function msgFunction;

  SendMessage({
    Key key,
    this.msgFunction,
  }) : super(key: key);

  final TextEditingController _textController = TextEditingController();

  void _handleSubmitted(String text) {
    msgFunction(text);
    _textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Flexible(
            child: TextField(
              controller: _textController,
              onSubmitted: (value) => _handleSubmitted(value),
              decoration: InputDecoration.collapsed(
                hintText: 'Send a message',
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            child: IconButton(
                icon: Icon(Icons.send),
                onPressed: () => _handleSubmitted(_textController.text)),
          ),
        ],
      ),
    );
  }
}
