import 'package:flutter/material.dart';
import 'package:practica4p2/widget/listas.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Listas(),
    );
  }
}
