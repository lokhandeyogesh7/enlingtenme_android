import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Common {
//showSnackBar
  showSnackBar(String message, BuildContext context) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

//save to sharedpreferences
  addStringToSF(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  Future<String?> getStringValuesSF(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    return prefs.getString(key);
  }

  deleteValueFromSF(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    await prefs.remove(key);
  }

  addBoolToSF(String key, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  getBoolValuesSF(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    return prefs.getBool(key);
  }
}