import 'package:flutter/material.dart';
import 'package:flutter_chatbot/message.dart';
import 'package:flutter_dialogflow/dialogflow_v2.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChatScreen extends StatefulWidget {
  final name;
  ChatScreen({required this.name});
  @override
  _ChatScreen createState() => new _ChatScreen();
}

class _ChatScreen extends State<ChatScreen> {
  final List<Message> _messages = <Message>[];
  final TextEditingController _textController = new TextEditingController();
  Widget _buildTextComposer() {
    return new IconTheme(
      data: new IconThemeData(color: Theme.of(context).primaryColor),
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: new Row(
          children: <Widget>[
            new Flexible(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
                child: new TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  controller: _textController,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                  autofocus: false,
                  onSubmitted: _submitted,
                  decoration: new InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 10.0),
                    hintText: "Send a message",
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide:
                          new BorderSide(color: Theme.of(context).primaryColor),
                    ),
                    focusedBorder: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide:
                          new BorderSide(color: Theme.of(context).primaryColor),
                    ),
                  ),
                ),
              ),
            ),
            new Container(
              margin: new EdgeInsets.symmetric(horizontal: 3.0),
              child: ElevatedButton(
                onPressed: () {
                  _submitted(_textController.text);
                },
                child: new FaIcon(
                  FontAwesomeIcons.share,
                  size: 30.0,
                  color: Colors.white,
                ),
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(10),
                  primary: Theme.of(context).primaryColor, // <-- Button color
                  onPrimary: Colors.teal, // <-- Splash color
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void response(query) async {
    _textController.clear();
    AuthGoogle authGoogle =
        await AuthGoogle(fileJson: "assets/service.json").build();
    Dialogflow dialogflow =
        Dialogflow(authGoogle: authGoogle, language: Language.english);
    AIResponse response = await dialogflow.detectIntent(query);
    print('QUERY---------------------->' + response.getMessage());
    Message message = new Message(
      text: response.getMessage(),
      name: "Jarvis",
      type: false,
    );
    setState(() {
      _messages.insert(0, message);
    });
  }

  void _submitted(String text) {
    _textController.clear();
    Message message = new Message(
      text: text,
      name: "${widget.name}",
      type: true,
    );
    setState(() {
      _messages.insert(0, message);
    });
    response(text);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: new Text("AI Chat Bot"),
      ),
      body: new Column(children: <Widget>[
        new Flexible(
            child: new ListView.builder(
          padding: new EdgeInsets.all(8.0),
          reverse: true,
          itemBuilder: (_, int index) => _messages[index],
          itemCount: _messages.length,
        )),
        new Divider(height: 1.0),
        new Container(
          decoration: new BoxDecoration(color: Theme.of(context).cardColor),
          child: _buildTextComposer(),
        ),
      ]),
    );
  }
}
