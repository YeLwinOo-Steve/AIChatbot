import 'package:flutter/material.dart';
import 'package:flutter_chatbot/chat_screen.dart';
import 'package:flutter_chatbot/constants.dart';
import 'package:flutter_chatbot/widgets/curve_clipper.dart';
import 'package:flutter_chatbot/widgets/icon_content.dart';
import 'package:flutter_chatbot/widgets/resuable_card.dart';
import 'package:flutter_chatbot/widgets/submit_button.dart';
import 'package:flutter_chatbot/widgets/textField.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//Gender type
enum Gender { male, female }

class UserInfo extends StatefulWidget {
  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  TextEditingController _nameController = TextEditingController();
  Gender selectedGender = Gender.male;
  late Size size;
  Stack _clipper({ required double height, required double width}) {
    return Stack(
      children: [
        ClipPath(
          clipper: CurveClipper(),
          child: Container(
            height: height,
            width: width,
            color: Theme.of(context).primaryColor,
          ),
        ),

      ],
    );
  }


  void _onPressedFunction() {
        Navigator.push(context,MaterialPageRoute(builder: (context)=> ChatScreen(name: _nameController.text,)));
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _clipper(
                width: double.infinity,
                height: size.height / 3),
            SizedBox(
              height: 10.0,
            ),
            TextFieldWidget(
              icon: Icons.person,
              textType: TextInputType.emailAddress,
              hintText: 'Enter Name',
              controller: _nameController,
              hWidth: 25.0,
              obscureText: false,
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              height: 170.0,
              child: Row(
                children: [
                  //Male Card
                  Expanded(
                    child: ReusableCard(
                      onPressed: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      colour: selectedGender == Gender.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        iconColor: selectedGender == Gender.male?Colors.white:Colors.grey,
                        label: "MALE",
                        labelTextStyle: selectedGender == Gender.male?kActiveLabel:kInactiveLabel,
                      ),
                    ),
                  ),

                  //Female Card
                  Expanded(
                    child: ReusableCard(
                      onPressed: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      colour: selectedGender == Gender.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.venus,
                        iconColor: selectedGender == Gender.female?Colors.white:Colors.grey,
                        label: "FEMALE",
                        labelTextStyle: selectedGender == Gender.female?kActiveLabel:kInactiveLabel,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30.0,
            ),


            SizedBox(
              height: 50.0,
            ),
            SubmitButton(
              text: 'Submit',
              hWidth: 25.0,
              onPressedFunction: _onPressedFunction,
            ),
          ],
        ),
      ),
    );
  }
}

