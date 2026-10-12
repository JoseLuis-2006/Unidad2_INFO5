import 'package:flutter/material.dart';
import 'package:practica10/widget/ventana1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Ventana1(),
    );
  }
}