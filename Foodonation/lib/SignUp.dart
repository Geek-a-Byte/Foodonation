import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_awesome_alert_box/flutter_awesome_alert_box.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Foodonation/settings.dart';

class SignUp extends StatefulWidget {
  SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String title = "Sign in";
  TextEditingController nidController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController AddController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confirmpasswordcontroller = TextEditingController();

  signup() async {
    var response;
    if (passwordcontroller.text == confirmpasswordcontroller.text) {
      var data = {
        "NID": nidController.text,
        "password": passwordcontroller.text
      };

      response =
          await http.post(baseURL + "/signup.php", body: jsonEncode(data));
      print(response.body);
      SuccessAlertBox(
          context: context, title: "great", messageText: response.body);
      Navigator.pushNamed(context, '/dashboard');

      /// Navigator.pushNamed(context, '/dashboard');
      /*,style: TextStyle(fontSize: 15,color: Colors.black),*/

    } else {
      WarningAlertBox(
          context: context,
          title: "wait!",
          messageText: "password and confirm pasword doesn't match.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(icon: Icon(Icons.settings), onPressed: () {}),
        ],
        title: Text(
          'Home',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Menu',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
            ListTile(
              title: Text(
                'Item 1',
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
              onTap: () {
                //setValue("isLoggedin", "false");
              },
            ),
            ListTile(
              title: Text('logout'),
              onTap: () {
                setValue("isLoggedin", "false");
              },
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.cyan,
        child: Center(
          child: Card(
            margin: EdgeInsets.all(18.0),

            //color: Color(hashCode),

            //color: Color.fromRGBO(0, 0, 40, 0.35),

            //color : const Color(0XFF880E4F), //0xff hocche opacity

            color: Colors.white,

            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Sign Up!",
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                fontSize: 30,
                                color: Colors.lightBlue[900],
                                letterSpacing: 2,
                                wordSpacing: 10,
                                fontWeight: FontWeight.w500))),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        style: TextStyle(
                          color: Colors.black87,
                        ),
                        controller: nameController,
                        decoration: InputDecoration(
                          labelText: "Requestor's Name:",

                          labelStyle: TextStyle(
                              fontSize: 15, color: Colors.lightBlueAccent[700]),

                          hintText: "your Name",

                          hintStyle: TextStyle(color: Colors.blueGrey),

                          enabledBorder: new UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),

                          // and:

                          focusedBorder: new UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        cursorColor: Colors.black,
                        //cursorWidth: 7.000000,
                        //cursorRadius: Radius.elliptical(10, 15),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        style: TextStyle(
                          color: Colors.black87,
                        ),
                        controller: AddController,
                        decoration: InputDecoration(
                          labelText: "Requestor's Address:",

                          labelStyle: TextStyle(
                              fontSize: 15, color: Colors.lightBlueAccent[700]),

                          hintText: "your Address",

                          hintStyle: TextStyle(color: Colors.blueGrey),

                          enabledBorder: new UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),

                          // and:

                          focusedBorder: new UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        cursorColor: Colors.black,
                        //cursorWidth: 7.000000,
                        //cursorRadius: Radius.elliptical(10, 15),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        style: TextStyle(
                          color: Colors.black87,
                        ),
                        controller: nidController,
                        decoration: InputDecoration(
                          labelText: "NID:",

                          labelStyle: TextStyle(
                              fontSize: 15, color: Colors.lightBlueAccent[700]),

                          hintText: "your NID",

                          hintStyle: TextStyle(color: Colors.blueGrey),

                          enabledBorder: new UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),

                          // and:

                          focusedBorder: new UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        cursorColor: Colors.black,
                        //cursorWidth: 7.000000,
                        //cursorRadius: Radius.elliptical(10, 15),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        style: TextStyle(
                          color: Colors.black87,
                        ),
                        controller: contactController,
                        decoration: InputDecoration(
                          labelText: "phn no:",

                          labelStyle: TextStyle(
                              fontSize: 15, color: Colors.lightBlueAccent[700]),

                          hintText: "your phone number",

                          hintStyle: TextStyle(color: Colors.blueGrey),

                          enabledBorder: new UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),

                          // and:

                          focusedBorder: new UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        cursorColor: Colors.black,
                        //cursorWidth: 7.000000,
                        //cursorRadius: Radius.elliptical(10, 15),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: passwordcontroller,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Password : ",

                          hintText: "*********",

                          labelStyle:
                              TextStyle(color: Colors.lightBlueAccent[700]),

                          enabledBorder: new UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),

                          // and:

                          focusedBorder: new UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        cursorColor: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: confirmpasswordcontroller,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Confirm Password : ",

                          hintText: "*********",

                          labelStyle:
                              TextStyle(color: Colors.lightBlueAccent[700]),

                          enabledBorder: new UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),

                          // and:

                          focusedBorder: new UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        cursorColor: Colors.black,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        RaisedButton(
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.person_add, color: Colors.white),
                                Text(
                                  "Sign up",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                              ],
                            ),
                            color: Colors.black,
                            onPressed: signup),

                        RaisedButton(
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.account_circle, color: Colors.white),
                                Text(
                                  title,
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                              ],
                            ),
                            color: Colors.black,
                            onPressed: () {
                              /*setState(() {
  
                       //title=nidController.text;                     
  
                     });*/
                              Navigator.pushNamed(context, '/signin');
                            }), //raised button
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
