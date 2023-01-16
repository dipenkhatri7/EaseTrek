import 'dart:convert';

import 'package:client/constant/constants.dart';
import 'package:client/constant/errorHandle.dart';
import 'package:client/constant/utils.dart';
import 'package:client/features/home/homeNav.dart';
import 'package:client/models/user.dart';
import 'package:client/provider/userProvider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  Future<void> signUpUser({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
    required BuildContext context,
  }) async {
    try {
      User user = User(
        id: '',
        name: name,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
        token: '',
      );
      debugPrint("HERE");
      http.Response res = await http.post(
        Uri.parse('http://localhost:3000/signup'),
        body: user.toJson(),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      debugPrint(res.statusCode.toString());
      debugPrint(res.body.toString());
      debugPrint("HERE2");
      httpErrorHandle(
          response: res,
          context: context,
          onSuccessful: () async {
            Provider.of<UserProvider>(context, listen: false).setUser(res.body);
            Navigator.pushNamedAndRemoveUntil(
                context, HomeNav.routeName, (route) => false);
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<void> signInUser({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      http.Response res = await http.post(Uri.parse('$uri/signIn'),
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode({
            'email': email,
            'password': password,
          }));
      httpErrorHandle(
          response: res,
          context: context,
          onSuccessful: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setString('Authorization', jsonDecode(res.body)['token']);
            Provider.of<UserProvider>(context, listen: false).setUser(res.body);
            Navigator.pushNamedAndRemoveUntil(
                context, HomeNav.routeName, (route) => false);
          });
    } catch (err) {
      showSnackBar(context, err.toString());
    }
  }

  void getUserData(BuildContext context) async {
    try {
      debugPrint("HERERER");
      SharedPreferences prefs = await SharedPreferences.getInstance();
      debugPrint("HERERER");
      String? token = prefs.getString('Authorization');
      debugPrint("HERE2");
      if (token == null) {
        prefs.setString('Authorization', "");
      }
      debugPrint(token);
      debugPrint("inside getUserData");

      var tokenRes = await http.post(
        Uri.parse('$uri/isTokenValid'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': token!,
        },
      );

      debugPrint("After getUserData");
      var response = jsonDecode(tokenRes.body);
      debugPrint(response.toString());
      if (response == true) {
        debugPrint("inside if");
        http.Response userRes = await http.get(
          Uri.parse('$uri/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': token
          },
        );
        debugPrint("inside if2");
        debugPrint(userRes.statusCode.toString());
        debugPrint(userRes.body.toString());
        Provider.of<UserProvider>(context, listen: false).setUser(userRes.body);
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
