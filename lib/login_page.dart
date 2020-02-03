import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:userapp/Controllers/databasehelper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  read() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;
    if(value != '0'){
      Navigator.of(context).push(
        new MaterialPageRoute(
          builder: (BuildContext context) => new HomePage(),
        )
      );
    }
  }

  @override
  initState(){
    read();
  }

  // For CircularProgressIndicator.
  bool visible = false;

  DatabaseHelper databaseHelper = new DatabaseHelper();
  String msgStatus = '';

  // Obteniendo valor del widget TextField.
  final TextEditingController rucController = new TextEditingController();
  final TextEditingController usernameController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  userLogin() async{
    setState(() {
      visible = true ;
    });
    setState(() {
      if(rucController.text.trim().isNotEmpty &&
        usernameController.text.trim().isNotEmpty &&
        passwordController.text.trim().isNotEmpty
      ){
        databaseHelper.loginData(rucController.text.trim(),
          usernameController.text.trim(),
          passwordController.text.trim()).whenComplete((){
            if(databaseHelper.status){
              setState(() {
                visible = false;
              });
              _showDialog();
              msgStatus = 'Verifica usuario o contraseña';
              debugPrint("Intenta otra ves");
            }else{
              setState(() {
                visible = false;
              });
              debugPrint("Ingresaste");
              // Navigator.pushReplacementNamed(context, '/homePage');
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (c, a1, a2) => HomePage(),
                  transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                  transitionDuration: Duration(seconds: 1),
                )
              );
            }
        });
      }
    });
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: new Form(
          key: _formKey,
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    '',
                    style: TextStyle(fontSize: 21),
                  ),
                ),
                Container(
                  width: 250,
                  padding: EdgeInsets.all(10.0),
                  child: new Image.asset(
                    'assets/upconta.jpg',
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
                  onPressed: (){
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
                Container(
                  height: 50,
                  child: new Text(
                    '$msgStatus',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  void _showDialog(){
    showDialog(
      context:context,
      builder:(BuildContext context){
        return AlertDialog(
          title: new Text('Error'),
          content: new Text('Compruebe las credenciales'),
          actions: <Widget>[
            new RaisedButton(
              child: new Text('Salir'),
              onPressed: (){
                Navigator.of(context).pop();
              },
              color: Color(0xFF14333F),
            )
          ],
        );
      }
    );
  }
}