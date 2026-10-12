import 'package:flutter/material.dart'; // Importa el paquete Material UI de Flutter / Imports Flutter Material UI package

class Listas extends StatefulWidget{ // Define un StatefulWidget para la gestión de listas / Defines a StatefulWidget for lists management
  @override
  State<StatefulWidget> createState() {
    return Clase();
  }

}

class Clase extends State<Listas>{ // Clase de estado que gestiona la lógica de números pares e impares / State class managing even and odd numbers logic

  TextEditingController caja = TextEditingController(); // Controlador para el campo de texto de entrada / Controller for input text field

  final List pares = []; // Lista para almacenar números pares / List to store even numbers
  final List impares = []; // Lista para almacenar números impares / List to store odd numbers

  void _agregar(){ // Método para validar y clasificar el número ingresado / Method to validate and classify the entered number
    String c = caja.text; // Obtiene el texto escrito en el campo / Gets text written in the field
    double? n = double.tryParse(c); // Intenta convertir el texto a número / Tries to convert text to number
    if (n != null){ // Comprueba si el número es válido / Checks if number is valid
      setState(() {
        if(n % 2 == 0){ // Verifica si el número es par / Checks if number is even
          pares.insert(
            0, n.toString() // Inserta el número par al inicio / Inserts even number at the start
          );
        }else{
          impares.insert(
            0, n.toString() // Inserta el número impar al inicio / Inserts odd number at the start
          );
        }
      });
      caja.clear(); // Limpia la caja de texto / Clears the text field
      FocusScope.of(context).unfocus(); // Oculta el teclado virtual / Hides the virtual keyboard
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Numero agregado'), // Mensaje de éxito / Success message
        behavior: SnackBarBehavior.floating // Comportamiento flotante del SnackBar / Floating SnackBar behavior
        )
      );
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Ingresa un numero valido'), // Mensaje de error / Error message
        behavior: SnackBarBehavior.floating // Comportamiento flotante del SnackBar / Floating SnackBar behavior
        )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listas Pares e Impares",
        style: TextStyle(
          fontWeight: FontWeight.bold, // Texto en negrita / Bold text
          color: Colors.white // Color blanco para el texto / White text color
        ),
        ),
        backgroundColor: Colors.blueAccent, // Color de fondo de la AppBar / AppBar background color
        actions: [
          Padding(padding: EdgeInsets.only(right: 15), // Margen derecho para el contador / Right margin for counter
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white, // Fondo blanco para el contador / White background for counter
              borderRadius: BorderRadius.circular(7) // Bordes redondeados / Rounded corners
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Elementos: ${pares.length + impares.length}', // Muestra el total de elementos combinados / Displays total combined elements
                style: TextStyle(
                  fontWeight: FontWeight.bold, // Texto en negrita para el contador / Bold text for counter
                ),
              ),
            ),
          ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                child: Card(
                  elevation: 8, // Elevación de la tarjeta principal / Main card elevation
                  shadowColor: Colors.black, // Color de sombra de la tarjeta / Card shadow color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8) // Bordes redondeados de la tarjeta / Card rounded corners
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        TextField(
                          controller: caja, // Controlador asignado al campo de texto / Controller assigned to text field
                          decoration: InputDecoration(
                            label: Text("Escribe un numero", // Etiqueta flotante del campo / Field floating label
                              style: TextStyle(
                                fontStyle: FontStyle.italic // Texto en cursiva para la etiqueta / Italic text for label
                              ),
                            ),
                            border: OutlineInputBorder() // Borde delineado del campo de texto / Outlined text field border
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _agregar, // Llama al método para agregar el número / Calls method to add number
                            child: Text("Agregar",
                              style: TextStyle(
                                color: Colors.green, // Color del texto del botón / Button text color
                                fontSize: 18, // Tamaño de fuente del botón / Button font size
                                fontWeight: FontWeight.bold // Texto en negrita para el botón / Bold text for button
                              ),
                            )
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10), // Espacio vertical de separación / Vertical separation space
              Row(
                children: [
                  Expanded(child: Center(child: Text("PARES: ${pares.length}", // Muestra la cantidad de números pares / Displays count of even numbers
                    style: TextStyle(
                      fontSize: 17, // Tamaño de fuente del contador / Counter font size
                      fontWeight: FontWeight.bold // Texto en negrita / Bold text
                    ),
                  ))),
                  Expanded(child: Center(child: Text("IMPARES: ${impares.length}", // Muestra la cantidad de números impares / Displays count of odd numbers
                    style: TextStyle(
                      fontSize: 17, // Tamaño de fuente del contador / Counter font size
                      fontWeight: FontWeight.bold // Texto en negrita / Bold text
                    ),
                  )))
                ],
              ),
              Expanded(
                child: Container(
                width: double.infinity,
                child: Row(
                  children: [
                    Expanded(
                      child: Card(
                        elevation: 3, // Elevación de la tarjeta de pares / Even list card elevation
                        child: ListView.builder(
                          itemCount: pares.length, // Número de elementos en la lista de pares / Number of items in even list
                          itemBuilder: (context, index) =>Card(
                            child: ListTile(
                              leading: Icon(Icons.numbers), // Icono indicador numérico / Numeric indicator icon
                              title: Text(pares[index]), // Muestra el número par actual / Displays current even number
                            ),
                          )
                        ),
                      ),
                    ),
                    Expanded(
                      child: Card(
                        elevation: 3, // Elevación de la tarjeta de impares / Odd list card elevation
                        child: ListView.builder(
                          itemCount: impares.length, // Número de elementos en la lista de impares / Number of items in odd list
                          itemBuilder: (context, index) =>Card(
                            child: ListTile(
                              leading: Icon(Icons.numbers), // Icono indicador numérico / Numeric indicator icon
                              title: Text(impares[index]), // Muestra el número impar actual / Displays current odd number
                            ),
                          )
                        ),
                      ),
                    )
                  ],
                ),
              )
              )
            ],
          ),
        ),
      )
    );
  }
}