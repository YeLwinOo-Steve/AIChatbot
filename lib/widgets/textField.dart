import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFieldWidget extends StatefulWidget {
  final IconData icon;
  final TextInputType textType;
  final String hintText;
  final TextEditingController controller;
  final double hWidth;
  bool obscureText;
  TextFieldWidget({required this.icon,required this.textType,required this.hintText,required this.controller,required this.hWidth,this.obscureText=false});
  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: widget.hWidth),
      child: ListTile(
        leading: Icon(
          widget.icon,
          color: Theme.of(context).primaryColor,
        ),
        title: TextField(
          obscureText: widget.obscureText,
          controller: widget.controller,
          keyboardType: widget.textType,
          decoration: InputDecoration(
            hintText: widget.hintText,
          ),
        ),
      ),
    );
  }
}
