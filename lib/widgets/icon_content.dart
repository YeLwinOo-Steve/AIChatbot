import 'package:flutter/material.dart';
import 'package:flutter_chatbot/constants.dart';

class IconContent extends StatelessWidget {
  final IconData icon;
  final String label;

  final Color iconColor;
  final TextStyle labelTextStyle;
  IconContent({required this.icon,required this.iconColor, required this.label, required this.labelTextStyle});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: iconColor,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          "$label",
          style: labelTextStyle,
        ),
      ],
    );
  }
}
