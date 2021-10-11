import 'package:flutter/material.dart';

class SubmitButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressedFunction;
  final double hWidth;
  SubmitButton({required this.text,required this.onPressedFunction,required this.hWidth});

  @override
  _SubmitButtonState createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: widget.hWidth),
        child: RaisedButton(
          color: Theme.of(context).primaryColor,
          padding: EdgeInsets.symmetric(vertical: 15.0),
          onPressed: widget.onPressedFunction,
          child: Text(
            widget.text,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
