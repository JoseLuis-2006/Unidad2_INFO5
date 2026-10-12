import 'package:flutter/material.dart';
import 'package:practica1p2/widget/lista1.dart';
import 'package:practica1p2/widget/lista2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Lista2(),
    );
  }
}
