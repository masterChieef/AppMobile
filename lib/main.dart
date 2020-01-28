import 'package:flutter/material.dart';
import 'main_options.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(
  MaterialApp(
    home: MyApp(),
  )
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            // appBar: AppBar(title: Text('Prueba UpConta')),
            body: Center(
                child: LoginUser()
            )
        )
    );
  }
}

class LoginUser extends StatefulWidget {

  _LoginUserState createState() => _LoginUserState();

}

class _LoginUserState extends State<LoginUser> {

  // For CircularProgressIndicator.
  bool visible = false;

  // Obteniendo valor del widget TextField.
  final rucController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  userLogin() async{

    setState(() {
      visible = true ;
    });

    // Obteniendo valor del controlador
    String ruc = rucController.text;
    String username = usernameController.text;
    String password = passwordController.text;

    // URL DE API DE INICIO DE SERVIDOR
    var url = 'https://testapi.upconta.com/auth';

    // Almacene todos los datos con el nombre del parámetro.
    var data = {'ruc': ruc, 'username': username, 'password' : password};

    // Iniciando llamada a la API web.
    http.Response response = await http.post(url, body: data);

    debugPrint(response.body);

    var status = response.body.contains('error');

    // Obtener respuesta del servidor en variable.
    var message = json.decode(response.body);

    if(status) {
      print('message : ${message["error"]}');
    }else{
      print('message : ${message["token"]}');
    }

    if(message == message) {

      setState(() {
        visible = false;
      });

      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfileScreen())
      );
    }

  /*  _save(String token) async {
      final prefs = await SharedPreferences.getInstance();
      final key = 'token';
      final value = token;
      prefs.setString(key, value);
    }

    read() async {
      final prefs = await SharedPreferences.getInstance();
      final key = 'token';
      final value = prefs.get(key) ?? 0;
      print('read : $value');
    } */

  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
              child: Column(
                children: <Widget>[

                  Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text('',
                          style: TextStyle(fontSize: 21))),

                  Container(
                    width: 250,
                    padding: EdgeInsets.all(10.0),
                    child: new Image.asset(
                      'assets/upConta.jpg',
                      fit:BoxFit.cover
                    ),
                  ),

                  Container(
                      width: 280,
                      padding: EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: rucController,
                        autocorrect: true,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: 'RUC',
                          hintText: 'Ingrese el RUC',
                          prefixIcon: Icon(
                            Icons.business
                          )
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'El campo ruc es obligatorio';
                          }
                          return null;
                        },
                      ),
                  ),

                  Container(
                      width: 280,
                      padding: EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: usernameController,
                        autocorrect: true,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: 'Usuario',
                          hintText: 'Ingrese el usuario',
                          prefixIcon: Icon(Icons.person)
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'El campo usuario es obligatorio';
                          }
                          return null;
                        },
                      )
                  ),

                  Container(
                      width: 280,
                      padding: EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: passwordController,
                        autocorrect: true,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: 'Contraseña',
                          hintText: 'Ingrese la contraseña',
                          prefixIcon: Icon(Icons.https)
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'El campo contraseña es obligatorio';
                          }
                          return null;
                        },
                      )
                  ),

                  RaisedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        userLogin();
                      }
                    },
                    color: Color(0xFF14333F),
                    textColor: Colors.white,
                    child: Text('Iniciar Sesión'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),

                  Visibility(
                      visible: visible,
                      child: Container(
                        alignment: Alignment.center,
                        child: CircularProgressIndicator()
                      )
                  ),

                ],
              ),
    );
  }
}

class ProfileScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: MainOptions()
    );
  }
}