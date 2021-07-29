import 'package:chat_screen/style/my_themes.dart';
import 'package:chat_screen/ui/chat_screen/chat_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyThemes.light,
      home: ChatScreen(),
    );
  }
}
