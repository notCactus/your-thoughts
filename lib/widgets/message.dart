import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      elevation: 4,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        leading: Container(
          child: FlutterLogo(
            size: 32,
          ),
        ),
        title: Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In vehicula blandit sapien bibendum gravida. Suspendisse aliquet molestie nulla. Vestibulum fermentum libero ac turpis faucibus aliquet vel dictum mauris. Dio scelerisque in. Phasellus nisl nunc, posuere vitae scelerisque.'),
      ),
    );
  }
}
