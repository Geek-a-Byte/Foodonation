import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

///https://mistcomputerclub.000webhostapp.com/
///
String baseURL = "https://foodonation.000webhostapp.com/";

///";
setValue(String key, String value) async {
  SharedPreferences storage = await SharedPreferences.getInstance();
  await storage.setString(key, value);
  //int counter = (prefs.getInt('counter') ?? 0) + 1;
  //print('Pressed $counter times.');
  //await prefs.setInt('counter', counter);
}

getValue(String key) async {
  SharedPreferences storage = await SharedPreferences.getInstance();
  return await storage.getString(key);
  //int counter = (prefs.getInt('counter') ?? 0) + 1;
  //print('Pressed $counter times.');
  //await prefs.setInt('counter', counter);
}
