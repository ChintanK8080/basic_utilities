library basic_utilities_ck;

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class JsonEncodable {
  Map<String, dynamic> toJson();
}

class BasicUtilitiesCk {
  static Future<void> clearPref() async {
    final pref = await SharedPreferences.getInstance();
    await pref.clear();
  }

  static Future<void> storeUserModel<T extends JsonEncodable>(T? user) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString(
      "UserPref",
      jsonEncode(
        user?.toJson(),
      ),
    );
  }

  static String? extensionRemover(String path) {
    try {
      final splited = path.split("?").first;
      return splited.split('.').toList().last;
    } catch (e) {
      return null;
    }
  }

  static Future<void> setStringList(
      {required String key, List<String>? data}) async {
    if (data?.isNotEmpty ?? false) {
      final pref = await SharedPreferences.getInstance();
      await pref.setStringList(
        key,
        data!,
      );
    }
  }

  static Future<void> setString({required String key, String? data}) async {
    if (data != null) {
      final pref = await SharedPreferences.getInstance();
      await pref.setString(key, data);
    }
  }

  static Future<void> setDouble({required String key, double? data}) async {
    if (data != null) {
      final pref = await SharedPreferences.getInstance();
      await pref.setDouble(key, data);
    }
  }

  static Future<void> setBool({required String key, bool? data}) async {
    if (data != null) {
      final pref = await SharedPreferences.getInstance();
      await pref.setBool(key, data);
    }
  }

  static Future<bool?> getBool({required String key}) async {
    final pref = await SharedPreferences.getInstance();
    return pref.getBool(key);
  }

  static Future<void> setInt({required String key, int? data}) async {
    if (data != null) {
      final pref = await SharedPreferences.getInstance();
      await pref.setInt(key, data);
    }
  }

  static Future<int?> getInt({required String key}) async {
    final pref = await SharedPreferences.getInstance();
    return pref.getInt(key);
  }

  static Future<void> storeAccessToken(String? accessToken) async {
    if (accessToken?.isNotEmpty ?? false) {
      final pref = await SharedPreferences.getInstance();
      await pref.setString("accessToken", accessToken!);
    }
  }

  static Future<String?> getAccessToken() async {
    final pref = await SharedPreferences.getInstance();
    var data = pref.getString(
      "accessToken",
    );
    return data;
  }

  static Future<void> storeAuthModel<T extends JsonEncodable>(T? user) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString(
      "AuthModel",
      jsonEncode(
        user?.toJson(),
      ),
    );
  }

  static bool isValidEmail(String email) {
    const pattern =
        r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$';
    final regExp = RegExp(pattern);
    return regExp.hasMatch(email);
  }

  static showSnackBar(BuildContext context,
      {required String message, Color? color, Duration? duration}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(),
          textAlign: TextAlign.center,
        ),
        backgroundColor: color,
        padding: EdgeInsets.all(0),
        duration: duration ?? Duration(seconds: 5),
      ),
    );
  }

  static showToast({
    required msg,
    Color? backgroundColor = Colors.white,
    Color? textColor,
  }) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: backgroundColor,
      textColor: textColor,
      fontSize: 16.0,
    );
  }

  // static void logWithLocation(String message) {
  //   String stackTrace = StackTrace.current.toString();
  //   List<String> lines = stackTrace.split("\n");
  //   String callerLine = lines[1].trim();
  //   int startIndex = callerLine.indexOf(" ");
  //   int endIndex = callerLine.lastIndexOf("(");
  // String callerFile = callerLine.substring(startIndex, endIndex).trim();
  // int? callerLineNumber =
  //     int.tryParse(callerLine.substring(endIndex + 1, callerLine.length - 1));
  // }
}
