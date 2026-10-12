import 'package:flutter/material.dart'; // Importa el paquete Material UI de Flutter / Imports Flutter Material UI package

class Numero extends StatefulWidget{ // Define un StatefulWidget que recibe datos / Defines a StatefulWidget that receives data
  final String dato; // Variable final para almacenar el dato recibido / Final variable to store received data

  const Numero({super.key, required this.dato}); // Constructor con parámetro obligatorio / Constructor with required parameter
  @override
  State<StatefulWidget> createState() {
    return Clase(); // Retorna la clase de estado / Returns the state class
  }
}

class Clase extends State<Numero>{ // Clase de estado para Numero / State class for Numero
  String d = ""; // Variable para mostrar el dato en pantalla / Variable to display data on screen
@override
  void initState(){ 
    super.initState(); // Inicializa el ciclo de vida del estado / Initializes state lifecycle
    d = widget.dato; // Asigna el dato recibido del widget padre / Assigns data received from parent widget
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Estructura base de la pantalla / Base screen layout
      backgroundColor: const Color.fromARGB(255, 130, 246, 190), // Color de fondo de la pantalla / Screen background color
      appBar: AppBar( // Barra superior de la aplicación / Application top app bar
        title: Text("Practica 7"), // Título de la AppBar / AppBar title
        backgroundColor: const Color.fromARGB(255, 69, 219, 154), // Color de fondo de la AppBar / AppBar background color
      ),
      body: Center( // Centra el contenido en pantalla / Centers content on screen
        child: Text(d, // Muestra el dato recibido en formato de texto / Displays received data as text
        style: TextStyle( // Estilos para el texto del dato / Styles for data text
          fontSize: 40, // Tamaño de fuente grande / Large font size
          fontWeight: FontWeight.bold // Texto en negrita / Bold text
        ),
        ),
      ),
    );
  }
}