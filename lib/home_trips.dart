import 'package:flutter/material.dart';

class HomeTrips extends StatelessWidget {

  logout(BuildContext context){
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: new Form(
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(90.0),
                  child: Text(
                    'Facturación',
                    style: TextStyle(fontSize: 21),
                  ),
                ),
                RaisedButton(
                  onPressed: (){},
                  color: Color(0xFF14333F),
                  textColor: Colors.white,
                  child: Text('Clientes'),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                RaisedButton(
                  onPressed: (){},
                  color: Color(0xFF14333F),
                  textColor: Colors.white,
                  child: Text('Firma Electronica'),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
