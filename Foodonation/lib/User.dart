import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class User extends StatefulWidget {
  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser user;

  @override
  void initState() {
    super.initState();
    initUser();
  }

  initUser() async {
    user = await _auth.currentUser();
    setState(() {});
  }

  Future<bool> _onBackPressed() {
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onBackPressed,
        child: new Scaffold(
          appBar: new AppBar(
            title: new Text(
              "My Profile",
              style: new TextStyle(color: Colors.white),
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Top text
              Center(
                child: Text(
                  'User Profile',
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'HelveticaNeue',
                    fontWeight: FontWeight.w700,
                    //Black Text
                    color: Color(0xff2D3436),
                    //White text
                    //color: Color(0xffFFFFFF),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Text("Name : "
                          "${user?.displayName} " +
                      "\n\n" +
                      "phone no : "
                          "${user?.phoneNumber}" +
                      "\n\n" +
                      "email address : "
                          "${user?.email}" +
                      "\n\n" +
                      "UID : "
                          "${user?.uid}" +
                      "\n\n"),
                ),
              ),

              //Description

              //Button
              // ButtonTheme(
              //   height: 48,
              //   child: RaisedButton(
              //       textColor: Colors.white,
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(25.0),
              //       ),
              //       color: Color(0xff0984e3),
              //       child: Text(
              //         'Go back',
              //         style: TextStyle(
              //           color: Color(0xffFFFFFF),
              //           fontSize: 15,
              //           fontFamily: 'Avenir',
              //           fontWeight: FontWeight.w700,
              //         ),
              //       ),
              //       onPressed: () {
              //         Navigator.pop(context, true);
              //       }

              //       //onPressed: () => Navigator.pushNamed(context, '/PageOne'),
              //       ),
              // ),
            ],
          ),
        ));

    // Future<bool> _onBackPressed() {
    //   return showDialog(
    //         context: context,
    //         builder: (context) => new AlertDialog(
    //           title: new Text('Are you sure?'),
    //           content: new Text('Do you want to exit an App'),
    //           actions: <Widget>[
    //             new GestureDetector(
    //               onTap: () => Navigator.of(context).pop(false),
    //               child: Text("NO"),
    //             ),
    //             SizedBox(height: 16),
    //             new GestureDetector(
    //               onTap: () => Navigator.of(context).pop(true),
    //               child: Text("YES"),
    //             ),
    //           ],
    //         ),
    //       ) ??
    //       false;
    // }
  }
}

//           FutureBuilder(
//               future: FirebaseAuth.instance.currentUser(),
//               builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
//                 if (snapshot.hasData) {
//                   return Text("User UID : " +
//                       snapshot.data.uid +
//                       "\n\n" +
//                       "User Mail : " +
//                       snapshot.data.email +
//                       "\n\n" +
//                       "User phoneNo : " +
//                       snapshot.data.phoneNumber);
//                 }
//               })
//
