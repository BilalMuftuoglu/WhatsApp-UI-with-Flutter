import 'package:flutter/material.dart';
import 'package:whatsapp_ui/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Roboto",
        brightness: Brightness.light,
      ),
      debugShowCheckedModeBanner: false,
      title: 'WhatsApp',
      // ignore: prefer_const_constructors
      home: homePage(),
    );
  }
}