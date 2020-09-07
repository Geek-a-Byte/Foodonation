import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_awesome_alert_box/flutter_awesome_alert_box.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Foodonation/SignUp.dart';
import 'package:Foodonation/settings.dart';

class SignIn extends StatefulWidget {
  SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // TextEditingController confirmpasswordcontroller = TextEditingController();
  TextEditingController nidController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  // String title = "Sign in";

  signin() async {
    var response;

    var data = {
      "nid": nidController.text,
      "name": nameController.text,
      "password": passwordcontroller.text
    };

    //response = await http.post(baseURL + "signin.php", body: jsonEncode(data));
    response = await http.post(baseURL + "signin.php", body: jsonEncode(data));
    //print(response.body);

    var jsonbody = jsonDecode(response.body);
    //print(jsonbody);

    // String jsonsDataString = response.body
    //     .toString(); // toString of Response's body is assigned to jsonDataString
    // var jsonbody = jsonDecode(jsonsDataString);
    if (jsonbody["nid"] == nidController.text &&
        jsonbody["name"] == nameController.text &&
        jsonbody["password"] == passwordcontroller.text) {
      SuccessAlertBox(
          context: context,
          title: "congrats!",
          messageText: "You are logged in, now select your package!");

      //print(7);
      setValue("isLoggedin", "true");
      setValue("name", jsonbody["name"]);
      setValue("nid", jsonbody["nid"]);
      setValue("phone", jsonbody["phone"]);
      //print(8);
      //navigation through pages
      Navigator.pushNamed(context, '/dashboard');
    } else if (jsonbody["success"] == "10") {
      print("Invalid NID or password");
      WarningAlertBox(
          context: context,
          title: "Wait!",
          messageText: "Invalid username or password");
    }

    /// Navigator.pushNamed(context, '/dashboard');
    /*,style: TextStyle(fontSize: 15,color: Colors.black),*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              title: Text('LogOut'),
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
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("LogIn Form",
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
                          labelText: "Name : ",

                          labelStyle:
                              TextStyle(fontSize: 15, color: Colors.black87),

                          hintText: "your Name",

                          hintStyle: TextStyle(color: Colors.black87),

                          enabledBorder: new UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),

                          // and:

                          focusedBorder: new UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        cursorColor: Colors.black87,
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
                          labelText: "NID : ",

                          labelStyle:
                              TextStyle(fontSize: 15, color: Colors.black87),

                          hintText: "your NID",

                          hintStyle: TextStyle(color: Colors.black87),

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

                          labelStyle: TextStyle(color: Colors.black87),

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
// *sign up button starts

                        // RaisedButton(
                        //     child: Row(
                        //       children: <Widget>[
                        //         Icon(Icons.person_add, color: Colors.white),
                        //         Text(
                        //           "Sign up",
                        //           style: TextStyle(
                        //               fontSize: 15, color: Colors.white),
                        //         ),
                        //       ],
                        //     ),
                        //     color: Colors.black,
                        //     onPressed: () {
                        //       Navigator.pushNamed(context, '/SignUp');
                        //     }),

//* signin button start

                        RaisedButton(
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.account_circle, color: Colors.white),
                                Text(
                                  "Sign in",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                              ],
                            ),
                            color: Colors.black,
                            onPressed: () {
                              /*setState(() {
  
                       //title=emailcontroller.text;                     
  
                     });*/
                              signin();
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

//? this is a question
//* this is an important part of code or important comment
//TODO: this is for future plans of refactoring or updating the codes with new features
//! this is the error/mistake/bad execution of code which should be avoided for the next time
