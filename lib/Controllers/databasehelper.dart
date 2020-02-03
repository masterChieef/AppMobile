import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class DatabaseHelper{
  String serveUrl = "https://testapi.upconta.com";
  var status;
  var token;

  loginData(String ruc, String username, String password) async{
    String loginUrl = "$serveUrl/auth";
    final response = await http.post(loginUrl,
      headers: {
        'Accept':'application/json'
      },
      body: {
        "ruc": "$ruc",
        "username": "$username",
        "password": "$password"
      }
    );
    status = response.body.contains('error');
    var data = json.decode(response.body);
    if(status){
      print('data : ${data["error"]}');
    }else{
      print('data : ${data["token"]}');
      _save(data["token"]);
    }
  }

  _save(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = token;
    prefs.setString(key, value);
  }

  read() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;
    print('read : $value');
  }

}
