import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import "package:shared_preferences/shared_preferences.dart";
import 'Login.dart';
import 'homepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

bool res;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences _preferences = await SharedPreferences.getInstance();
  res = _preferences.getBool("login");

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _fbapp = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: res == true ? "/welcome" : "/login",
      routes: {
        '/login': (context) => show(Login()),
        "/welcome": (context) => show(homepage()),
      },
    );
  }

  Widget show(Widget widget) {
    return FutureBuilder(
        future: _fbapp,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Wrong");
          } else if (snapshot.hasData) {
            return widget;
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
