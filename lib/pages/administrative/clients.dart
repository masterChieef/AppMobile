import 'package:flutter/material.dart';

class Clients extends StatefulWidget{
  _ClientsState createState() => _ClientsState();
}

class _ClientsState extends State<Clients>{
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
                    'Clientes',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                Container(
                  width: 300,
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'Tipo de Identificación',
                    ),
                  ),
                ),
                Container(
                  width: 300,
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'N° Identificación',
                      hintText: 'Ingrese Identificación'
                    ),
                  ),
                ),
                Container(
                  width: 300,
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'Nombres / Razón Social',
                      hintText: 'Nombre y Apellidos / Razón Social'
                    ),
                  ),
                ),
                Container(
                  width: 300,
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'Tipo de Sujeto',
                    ),
                  ),
                ),
                Container(
                  width: 300,
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'Teléfono convencional',
                      hintText: 'Teléfono convencional',
                    ),
                  ),
                ),
                Container(
                  width: 300,
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'Teléfono celular',
                      hintText: 'Teléfono celular'
                    ),
                  ),
                ),
                Container(
                  width: 300,
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'Correo electrónico',
                      hintText: 'Correo electrónico',
                    ),
                  ),
                ),
                Container(
                  width: 300,
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'Correo alternativo Opcional',
                      hintText: 'Correo alternativo'
                    ),
                  ),
                ),
                Container(
                  width: 300,
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'Ciudad',
                      hintText: 'Ciudad'
                    ),
                  ),
                ),
                Container(
                  width: 300,
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'Dirección',
                      hintText: 'Dirección'
                    ),
                  ),
                ),
                RaisedButton(
                  onPressed: (){},
                  color: Color(0xFFE76112),
                  textColor: Colors.white,
                  child: Text('Guardar'),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
