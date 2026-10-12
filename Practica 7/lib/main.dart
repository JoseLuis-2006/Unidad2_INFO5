import 'package:flutter/material.dart';
import 'package:practica7/widget/aplicacion.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Aplicacion(),
    );
  }
}
