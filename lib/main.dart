import 'package:diversus/LoginScreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diversus',
      theme: ThemeData(
        // dialogBackgroundColor: Colors.white.withAlpha(180),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Color.fromRGBO(32, 36, 58, 1)),
        primaryColor: Color.fromRGBO(32, 36, 58, 1),
        appBarTheme: AppBarTheme(color: Colors.white, elevation: 0),
      ),
      home: LoginScreen(),
    );
  }
}
