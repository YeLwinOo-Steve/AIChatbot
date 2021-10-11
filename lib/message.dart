import 'package:avatar_view/avatar_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Message extends StatelessWidget {
  Message({required this.text, required this.name, required this.type});

  final String text;
  final String name;
  final bool type;

  List<Widget> botMessage(context) {
    return <Widget>[
      new Container(
        margin: const EdgeInsets.only(right: 8.0),
        child: AvatarView(
          radius: 20,
          avatarType: AvatarType.CIRCLE,
          backgroundColor: Theme.of(context).primaryColor,
          imagePath:
          "assets/bot.png",
          placeHolder: Container(
            child: Icon(Icons.person, size: 50,),
          ),
          errorWidget: Container(
            child: Icon(Icons.error, size: 50,),
          ),
        ),
      ),
      new Expanded(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text(this.name,
                style: new TextStyle(fontWeight: FontWeight.bold)),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              color: Color(0xFFDCDCDC),
              child: new Container(
                padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                margin:
                const EdgeInsets.symmetric(vertical: 4.0, horizontal: 2.0),
                child: new Text(
                  text,
                  style: GoogleFonts.ubuntu(
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ];
  }

  List<Widget> myMessage(context) {
    return <Widget>[
      new Expanded(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            new Text(
              this.name,
              style: TextStyle(
                  fontSize: 14.0,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              color: Theme.of(context).primaryColor,
              child: new Container(
                padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                margin:
                    const EdgeInsets.symmetric(vertical: 4.0, horizontal: 2.0),
                child: new Text(
                  text,
                  style: GoogleFonts.ubuntu(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      new Container(
        margin: const EdgeInsets.only(left: 8.0),
        child: AvatarView(
          radius: 20,
          avatarType: AvatarType.CIRCLE,
          backgroundColor: Theme.of(context).primaryColor,
          imagePath:
          "assets/male.png",

          placeHolder: Container(
            child: Icon(Icons.person, size: 50,),
          ),
          errorWidget: Container(
            child: Icon(Icons.error, size: 50,),
          ),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: this.type ? myMessage(context) : botMessage(context),
      ),
    );
  }
}
