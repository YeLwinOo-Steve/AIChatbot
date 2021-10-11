import 'package:flutter/material.dart';
import 'package:flutter_chatbot/chat_screen.dart';
import 'package:flutter_chatbot/splash_screen.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'ChatBot',
      theme: new ThemeData(
        primaryColor: Color(0xFF349D9E),
      ),
      debugShowCheckedModeBanner: false,
      home: new MySplashScreen(),
    );
  }
}