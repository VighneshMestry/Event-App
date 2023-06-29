import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:local_event_app/constants/global_variables.dart';
import 'package:local_event_app/models/user.dart';
import 'package:local_event_app/provider/user_provider.dart';
import 'package:local_event_app/ui/homepage/home_page.dart';
import 'package:local_event_app/widgets/snack_bar.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  void signUpUser({
    required BuildContext context,
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      User user = User(
        id: '',
        name: name,
        password: password,
        email: email,
        address: '',
        type: '',
        token: '',
      );
      http.Response res = await http.post(
        Uri.parse('$uri/api/signup'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: user.toJson(),
      );

      if (res.statusCode == 200) {
        // ignore: use_build_context_synchronously
        showSnackBar(context, 'Account Created! Login with same credentials');
      } else {
        // ignore: use_build_context_synchronously
        showSnackBar(context, res.body);
      }
    } catch (e) {
      showSnackBar(context, "Error in authservices");
    }
  }

  void loginUser({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse("$uri/api/login"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(
          {
            'email': email,
            'password': password,
          },
        ),
      );
      if (res.statusCode == 200) {
        SharedPreferences prefs = await SharedPreferences.getInstance();

        // ignore: use_build_context_synchronously
        Provider.of<UserProvider>(context, listen: false).setUser(res.body);
        await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);
        // ignore: use_build_context_synchronously
        await Navigator.pushNamedAndRemoveUntil(
          context,
          HomePage.routeName,
          (route) => false,
        );
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
