import 'package:flutter/material.dart'; // Importa el paquete de Material UI de Flutter / Imports Flutter Material UI package
import 'package:practica7/widget/numero.dart'; // Importa el widget personalizado Numero / Imports custom Numero widget

class Aplicacion extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Clase(); // Retorna la clase de estado asociada / Returns associated state class
  }
}

class Clase extends State<Aplicacion>{
  TextEditingController caja = new TextEditingController(); // Controlador para gestionar el campo de texto / Controller to manage text field
  String texto = ""; // Variable para almacenar mensajes de estado / Variable to store status messages

  void validar (){ // Método para validar si la caja de texto tiene contenido / Method to validate if text box has content
    String c = caja.text; // Obtiene el valor actual del campo de texto / Gets current value from text field
    setState(() {
      if(c == ""){
        texto = "La caja de texto esta vacia"; // Mensaje cuando está vacío / Message when empty
      }else{
        texto = "La caja de texto No esta vacia"; // Mensaje cuando tiene texto / Message when it has text
        alertas(); // Llama a la función que muestra una alerta / Calls function to show an alert
      }
    });
  }

  void alertas(){ // Método para mostrar un cuadro de diálogo de alerta / Method to display an alert dialog box
    showDialog(
      context: context, 
      builder: (context){
        return AlertDialog(
          title: Text("Alerta"), // Título de la ventana de alerta / Alert dialog title
          content: Text(caja.text), // Muestra el texto ingresado dentro de la alerta / Displays entered text inside alert
          actions: [
            TextButton(
              onPressed: (){ // Acción al presionar el botón de la alerta / Action when alert button is pressed
                String d = caja.text; // Extrae el texto ingresado / Extracts entered text
                if(int.tryParse(d) != null){ // Comprueba si el texto es un número entero válido / Checks if text is a valid integer
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => Numero(
                        dato : d // Envía el dato numérico al siguiente widget / Passes numeric data to the next widget
                      )))
                  );
                  caja.clear(); // Limpia la caja de texto / Clears the text field
                }else{
                  Navigator.of(context).pop(); // Cierra el cuadro de diálogo / Closes the dialog box
                }
              }, 
              child: Text("Aceptar") // Texto del botón de confirmación / Confirmation button text
            )
          ],
        );
      }
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 201, 254, 140), // Color de fondo principal de la pantalla / Main screen background color
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 120, 222, 123), // Color de fondo de la barra superior / AppBar background color
        title: Text("Practica 7",
        style: TextStyle(
          color: Colors.white, // Color del texto del título / Title text color
          fontSize: 25 // Tamaño de fuente del título / Title font size
        ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Card(
                  elevation: 8, // Elevación de la sombra de la tarjeta / Card shadow elevation
                  shadowColor: Colors.black, // Color de la sombra de la tarjeta / Card shadow color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8) // Bordes redondeados de la tarjeta / Card rounded corners
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: 50), // Espacio vertical fijo / Fixed vertical spacing
                          Container(
                            width: double.infinity,
                            child: TextField(
                              controller: caja, // Vincula el controlador de texto / Binds text controller
                              decoration: InputDecoration(
                                labelText: "Escribe...", // Texto flotante indicador en el campo / Input floating label text
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8) // Borde redondeado del campo de texto / Text field rounded border
                                )
                              ),
                            ),
                          ),
                          SizedBox(height: 40), // Espacio vertical fijo / Fixed vertical spacing
                          Container(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              onPressed: validar, // Llama al método de validación al hacer clic / Calls validation method on click
                              label: Text("Aceptar") // Texto descriptivo del botón / Button label text
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Card(
                  elevation: 8, // Elevación de la tarjeta inferior / Lower card shadow elevation
                  shadowColor: Colors.black, // Color de sombra de la tarjeta inferior / Lower card shadow color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8) // Bordes redondeados de la tarjeta / Card rounded corners
                  ),
                  child: Padding(
                    padding:  EdgeInsets.all(30.0),
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: Center(
                        child: Text(texto, // Muestra el mensaje de texto dinámico / Displays dynamic text message
                        style: TextStyle(
                          fontSize: 34, // Tamaño de la fuente del mensaje / Message font size
                          color: Colors.blue, // Color del texto del mensaje / Message text color
                          fontWeight: FontWeight.bold, // Aplica estilo negrita / Applies bold style
                          fontFamily: "Comic Sans" // Tipo de fuente tipográfica / Font family style
                        )
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}