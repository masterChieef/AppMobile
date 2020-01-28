import 'package:flutter/material.dart';
import 'home_trips.dart';
import 'search_trips.dart';
import 'profile_trips.dart';


class MainOptions extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainOptions();
  }
}

class _MainOptions extends State<MainOptions> {

  int indexTap = 0;
  final List<Widget> widgetsChildren = [
    HomeTrips(),
    SearchTrips(),
    ProfileTrips(),
  ];

  void onTapTapped(int index){
    setState(() {
      indexTap = index;
    });
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: widgetsChildren[indexTap],
     bottomNavigationBar: Theme(
       data: Theme.of(context).copyWith(
         canvasColor: Colors.white,
         primaryColor: Color(0xFFE76112),
       ),
       child: BottomNavigationBar(
         onTap: onTapTapped,
         currentIndex: indexTap,
         items: [
           BottomNavigationBarItem(
             icon:  Icon(Icons.home),
             title: Text("home"),
           ),
           BottomNavigationBarItem(
             icon: Icon(Icons.search),
             title: Text("Buscar"),
           ),
           BottomNavigationBarItem(
             icon: Icon(Icons.person),
             title: Text("Usuario"),
           )
         ],
       )
     ),
   );
  }
}
