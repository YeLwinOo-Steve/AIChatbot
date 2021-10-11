import 'package:flutter/material.dart';
import 'package:flutter_chatbot/user_info.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:splashscreen/splashscreen.dart';

class MySplashScreen extends StatefulWidget {
  @override
  _MySplashScreenState createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      navigateAfterSeconds: UserInfo(),
      title: Text(
          'AI ChatBot',
        style:
        GoogleFonts.ubuntu(fontSize: 40, color: Colors.white,fontWeight: FontWeight.bold),
      ),
      image: Image.asset('assets/robot.png'),
      backgroundColor: Theme.of(context).primaryColor,
      photoSize: 100,
      loaderColor: Colors.white,
      loadingText: Text('by Ye Lwin Oo',style: GoogleFonts.ubuntu(color: Colors.white,fontSize: 20),),
    );
  }
}
