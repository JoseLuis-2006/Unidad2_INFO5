import 'package:flutter/material.dart'; // Importa el paquete Material UI de Flutter / Imports Flutter Material UI package
import 'package:flutter/services.dart'; // Importa servicios del sistema de Flutter / Imports Flutter system services package
import 'package:practica10/widget/ventana2.dart'; // Importa el archivo de la segunda ventana / Imports the second window file

class Ventana1 extends StatefulWidget{ // Define un StatefulWidget para la primera ventana / Defines a StatefulWidget for the first window
  @override
  State<StatefulWidget> createState() {
    return Clase(); // Retorna la clase de estado asociada / Returns associated state class
  }
}

class Clase extends State<Ventana1>{ // Clase de estado que gestiona la lógica del formulario / State class managing form logic

  TextEditingController nombre = TextEditingController(); // Controlador para el campo de texto del nombre / Controller for the name text field
  TextEditingController correo = TextEditingController(); // Controlador para el campo de texto del correo / Controller for the email text field
  TextEditingController contrasena = TextEditingController(); // Controlador para el campo de texto de la contraseña / Controller for the password text field

  void _validar(){ // Método para validar los datos ingresados / Method to validate entered data
    String n = nombre.text; // Obtiene el texto del nombre / Gets the name text
    String cor = correo.text; // Obtiene el texto del correo / Gets the email text
    String con = contrasena.text; // Obtiene el texto de la contraseña / Gets the password text

    int? num = int.tryParse(con); // Intenta convertir la contraseña a número entero / Tries to convert password to integer

    if(n.isNotEmpty && cor.isNotEmpty && con.isNotEmpty){ // Verifica que ningún campo esté vacío / Verifies no field is empty
      if(n.length>2){ // Valida que el nombre tenga más de 2 caracteres / Validates name has more than 2 characters
        if(num != null && (con.length>4 && con.length<11)){ // Valida que la contraseña sea numérica y tenga entre 5 y 10 caracteres / Validates password is numeric and between 5 and 10 characters long
          Navigator.pushReplacement(
            context, 
            MaterialPageRoute(
              builder: (context) => Ventana2(
                nombre2 : n // Pasa el nombre como parámetro a la segunda ventana / Passes name as a parameter to the second window
              ))
      );
        }else{
          alerta('Error', 'La contraseña no es valida'); // Muestra alerta si la contraseña no es válida / Shows alert if password is invalid
        }
      }else{
        alerta('Error', 'El nombre no es valido'); // Muestra alerta si el nombre no es válido / Shows alert if name is invalid
      }
    }else{
      alerta('Error', 'Faltan datos'); // Muestra alerta si faltan campos por llenar / Shows alert if data is missing
    }
  }

  void alerta(String t, String tx){ // Método para mostrar un cuadro de diálogo de alerta / Method to show an alert dialog box
    showDialog( 
      context: context,
      builder: (context){
        return AlertDialog( 
          title: Text(t,
            style: TextStyle( 
              fontSize: 23,
              color: Colors.redAccent, // Color rojo de acento para el título / Red accent color for title
              fontWeight: FontWeight.bold // Texto en negrita para el título / Bold text for title
            ),
          ),
          content: Text(tx, 
            style: TextStyle( 
              fontSize: 18,
              fontWeight: FontWeight.bold // Texto en negrita para el contenido / Bold text for content
            ),
          ),
          actions: [
            TextButton(
              onPressed: (){ 
                Navigator.of(context).pop(); // Cierra el cuadro de diálogo / Closes the dialog box
              }, 
              child: Text("Cerrar",
                style: TextStyle(
                  fontSize: 18 // Tamaño de fuente del botón de cierre / Close button font size
                ),
              )
            )
          ],
        );
      }
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber, // Color de fondo ámbar para la AppBar / Amber background color for AppBar
        title: Text("Practica 10",
          style: TextStyle(
            fontWeight: FontWeight.bold, // Texto en negrita para el título / Bold text for title
          ),
        ),
      ),
      body: Center( // Centra el contenido en pantalla / Centers content on screen
        child: Padding(
          padding: const EdgeInsets.all(10.0), // Relleno general para los elementos / General padding for items
          child: Container(
            width: double.infinity,
            child: Card(
              elevation: 8, // Sombreelevado de la tarjeta / Elevated card shadow
              child: Padding(
                padding: const EdgeInsets.all(8.0), // Relleno interno de la tarjeta / Card internal padding
                child: Column(
                  mainAxisSize: MainAxisSize.min, // Ajusta la columna al tamaño de su contenido / Sizes column to content size
                  children: [
                    Text("Login",
                      style: TextStyle(
                        fontWeight: FontWeight.bold, // Texto en negrita para el título Login / Bold text for Login title
                        fontSize: 30 // Tamaño de fuente grande / Large font size
                      ),
                    ),
                    SizedBox(height:20), // Espacio vertical de separación / Vertical separation space
                    TextField(
                      controller: nombre, // Controlador asignado al campo de nombre / Controller assigned to name field
                      decoration: InputDecoration(
                        border: OutlineInputBorder(), // Borde delineado del campo / Outlined field border
                        label: Text("Escribe el nombre") // Etiqueta flotante del campo / Field floating label
                      ),
                    ),
                    SizedBox(height:10), // Espacio vertical de separación / Vertical separation space
                    TextField(
                      controller: correo, // Controlador asignado al campo de correo / Controller assigned to email field
                      decoration: InputDecoration(
                        border: OutlineInputBorder(), // Borde delineado del campo / Outlined field border
                        label: Text("Escribe el correo") // Etiqueta flotante del campo / Field floating label
                      ),
                    ),
                    SizedBox(height:10), // Espacio vertical de separación / Vertical separation space
                    TextField(
                      controller: contrasena, // Controlador asignado al campo de contraseña / Controller assigned to password field
                      decoration: InputDecoration(
                        border: OutlineInputBorder(), // Borde delineado del campo / Outlined field border
                        label: Text("Escribe la contraseña") // Etiqueta flotante del campo / Field floating label
                      ),
                    ),
                    SizedBox(height:20), // Espacio vertical de separación / Vertical separation space
                    Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _validar, // Llama al método de validación al presionar / Calls validation method on press
                        child: Text('Aceptar',
                        style: TextStyle(
                          color: const Color.fromARGB(255, 29, 121, 32), // Color verde personalizado para el texto / Custom green color for text
                          fontSize: 18 // Tamaño de fuente del texto del botón / Button text font size
                        ),
                        )
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}