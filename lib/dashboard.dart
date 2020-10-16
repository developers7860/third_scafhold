import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:third_scafhold/login.dart';

class DashBoardScrenn extends StatelessWidget {
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Dashboard",
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dashboard'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                _auth.signOut().then((value) => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                    (route) => false));
              },
            )
          ],
        ),
        body: Center(
          child: Text("Hello user"),
        ),
      ),
    );
  }
}
