import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_awesome_alert_box/flutter_awesome_alert_box.dart';
import 'package:http/http.dart' as http;

class Comment extends StatefulWidget {
  Comment({Key key}) : super(key: key);

  @override
  _CommentState createState() => _CommentState();
}

class _CommentState extends State<Comment> {
  String _inputtext;
  TextEditingController comment = TextEditingController();
  bool pressOn = false;

/*@override
void initState() { 
  super.initState();
  comment = TextEditingController();
}*/

  void _processText() {
    setState(() {
      _inputtext = comment.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Send Feedback',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 30),
              child: TextField(
                minLines: 1,
                maxLines: 5,
                textAlign: TextAlign.left,
                controller: comment,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(20.0),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: 'PLEASE ENTER COMMENT',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
              padding: const EdgeInsets.all(20.0),
            ),
            ButtonTheme(
              minWidth: 200,
              height: 50,
              child: RaisedButton(
                child: Text('Submit'),
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(8.0),
                  //side: BorderSide(color: Colors.red)
                ),
                color: pressOn ? Colors.grey : Colors.blue,
                textColor: Colors.white,
                onPressed: () {
                  _processText();
                  setState(() => pressOn = !pressOn);
                  const url =
                      'https://foodonation-129a8.firebaseio.com/feedBack.json';
                  http.post(url,
                      body: json.encode({
                        'comment': comment.text,
                      }));
                  SuccessAlertBox(
                      context: context,
                      title: "Great!!",
                      messageText: "Thanks for your feedback :)");
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
