import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutterapp/Services/globals.dart';
import 'package:http/http.dart' as http;

class AuthServices {
  static Future<http.Response> register(String folio, String matricula,
      String name, String email, String password) async {
    Map data = {
      "folio": folio,
      "matricula": matricula,
      "name": name,
      "email": email,
      "password": password,
    };
    var body = json.encode(data);
    var url = Uri.parse(baseURL + 'auth/register');
    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    print(response.body);

    return response;
  }

  static Future<http.Response> login(String email, String password) async {
    Map data = {'email': email, 'password': password};
    var response = await http
        .post(Uri.parse('http://192.168.1.78:8000/api/auth/login'), body: data);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', jsonData['token']);
      await prefs.setString('username', jsonData['user']['matricula']);
    }
    return response;
  }
}
