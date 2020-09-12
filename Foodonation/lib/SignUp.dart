import 'dart:convert';
import 'package:flutter/gestures.dart';
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
  bool _showPhn = false;
  bool _showPass = false;
  bool _showConfirmPass = false;

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

  void _togglePass() {
    setState(() {
      _showPass = !_showPass;
    });
  }

  void _togglePhn() {
    setState(() {
      _showPhn = !_showPhn;
    });
  }

  void _toggleConfirmPass() {
    setState(() {
      _showConfirmPass = !_showConfirmPass;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size devSize = MediaQuery.of(context).size; //Gets device dimension

    return Scaffold(
      body: Container(
        //color: Color(0xffdfe6e9),
        color: Colors.blue,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Create account
                Padding(
                  padding: EdgeInsets.only(
                    top: devSize.height * .1,
                    left: devSize.width * .06,
                  ),
                  child: Text(
                    "Create  Account",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontFamily: 'HelveticaNeue',
                      fontWeight: FontWeight.w700,
                      //wordSpacing: 10,
                    ),
                  ),
                ),

                Expanded(
                  child: Card(
                    elevation: 0,
                    margin: EdgeInsets.only(top: devSize.height * .03),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),

                    //color: Color(hashCode),

                    //color: Color.fromRGBO(0, 0, 40, 0.35),

                    //color : const Color(0XFF880E4F), //0xff hocche opacity

                    color: Colors.white,

                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.05,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.025,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: TextFormField(
                                style: TextStyle(
                                  color: Colors.black87,
                                ),
                                controller: nameController,
                                decoration: InputDecoration(
                                  labelText: "Name:",

                                  labelStyle: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black54,
                                    fontFamily: 'HelveticaNeue',
                                    fontWeight: FontWeight.w700,
                                  ),

                                  hintText: "Your Name",

                                  hintStyle: TextStyle(color: Colors.blueGrey),

                                  enabledBorder: new UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
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
                                  labelText: "Address:",

                                  labelStyle: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'HelveticaNeue',
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black54),

                                  hintText: "Your Address",

                                  hintStyle: TextStyle(
                                      fontFamily: 'HelveticaNeue',
                                      fontWeight: FontWeight.w500,
                                      color: Colors.blueGrey),

                                  enabledBorder: new UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
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
                                      fontSize: 15,
                                      fontFamily: 'HelveticaNeue',
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black54),

                                  hintText: "Your NID",

                                  hintStyle: TextStyle(
                                      fontFamily: 'HelveticaNeue',
                                      fontWeight: FontWeight.w500,
                                      color: Colors.blueGrey),

                                  enabledBorder: new UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
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
                                obscureText: (_showPhn == true) ? false : true,
                                style: TextStyle(
                                  fontFamily: 'HelveticaNeue',
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black54,
                                ),
                                controller: contactController,
                                decoration: InputDecoration(
                                  labelText: "Phone no:",

                                  labelStyle: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'HelveticaNeue',
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black54),

                                  hintText: "Your phone number",

                                  suffixIcon: IconButton(
                                    onPressed: _togglePhn,
                                    icon: _showPhn
                                        ? Icon(Icons.visibility_off)
                                        : Icon(Icons.visibility),
                                  ),

                                  hintStyle: TextStyle(
                                      fontFamily: 'HelveticaNeue',
                                      fontWeight: FontWeight.w500,
                                      color: Colors.blueGrey),

                                  enabledBorder: new UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
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
                                obscureText: (_showPass == true) ? false : true,
                                decoration: InputDecoration(
                                  labelText: "Password:",

                                  hintText: "*********",

                                  suffixIcon: IconButton(
                                    onPressed: _togglePass,
                                    icon: _showPass
                                        ? Icon(Icons.visibility_off)
                                        : Icon(Icons.visibility),
                                  ),

                                  labelStyle: TextStyle(
                                      fontFamily: 'HelveticaNeue',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15,
                                      color: Colors.black54),

                                  enabledBorder: new UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
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
                                obscureText: (_showConfirmPass == true) ? false : true,
                                decoration: InputDecoration(
                                  labelText: "Confirm Password:",

                                  hintText: "*********",

                                  suffixIcon: IconButton(
                                    onPressed: _toggleConfirmPass,
                                    icon: _showConfirmPass
                                        ? Icon(Icons.visibility_off)
                                        : Icon(Icons.visibility),
                                  ),

                                  labelStyle: TextStyle(
                                      fontFamily: 'HelveticaNeue',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15,
                                      color: Colors.black54),

                                  enabledBorder: new UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),

                                  // and:

                                  focusedBorder: new UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                ),
                                cursorColor: Colors.black,
                              ),
                            ),

                            //Buttons
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: ButtonTheme(
                                    minWidth: 150,
                                    height: 40,
                                    child: RaisedButton(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      color: Color(0xff0984e3),
                                      child: Row(
                                        children: <Widget>[
                                          //Icon(Icons.person_add, color: Colors.white),  I PERSONALLY DON'T PREFER THIS THO
                                          Text(
                                            "Sign Up",
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white,
                                              fontFamily: 'Avenir',
                                            ),
                                          ),
                                        ],
                                      ),
                                      //color: Colors.black,    I CHANGED THIS//RAIYAN
                                      onPressed: signup,
                                    ),
                                  ),
                                ), //raised button
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: new RichText(
                                text: new TextSpan(
                                  children: [
                                    new TextSpan(
                                      text: "Already have an account? ",
                                      style:
                                          new TextStyle(color: Colors.black54),
                                    ),
                                    new TextSpan(
                                      text: 'Sign in!',
                                      style: new TextStyle(color: Colors.blue),
                                      recognizer: new TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.pushNamed(
                                              context, '/signin');
                                        },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
