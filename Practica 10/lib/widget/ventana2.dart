import 'package:flutter/material.dart'; // Importa el paquete Material UI de Flutter / Imports Flutter Material UI package

class Ventana2 extends StatefulWidget{
  final String nombre2; // Variable final para recibir el nombre / Final variable to receive the name
  const Ventana2({super.key, required this.nombre2}); // Constructor con parámetro obligatorio / Constructor with required parameter
  @override
  State<StatefulWidget> createState() {
    return Clase2(); // Retorna la clase de estado / Returns the state class
  }
}

class items{ // Clase modelo para los elementos de contacto / Model class for contact items
  final String titulo; // Título o nombre del contacto / Contact title or name
  final String subtitulo; // Subtítulo o teléfono del contacto / Contact subtitle or phone
  items(this.titulo,this.subtitulo); // Constructor del modelo / Model constructor
}

class Clase2 extends State<Ventana2>{
  String n = ""; // Variable para almacenar el nombre recibido / Variable to store received name
  TextEditingController nom = TextEditingController(); // Controlador para el campo de nombre / Controller for the name field
  TextEditingController tel = TextEditingController(); // Controlador para el campo de teléfono / Controller for the phone field

  final List <items> lista = []; // Lista dinámica para almacenar los contactos / Dynamic list to store contacts

  void initState(){ 
    super.initState(); // Inicializa el ciclo de vida del estado / Initializes state lifecycle
    n = widget.nombre2; // Asigna el nombre recibido a la variable local / Assigns received name to local variable
  }

  void _boton(){ // Método para procesar y agregar el contacto / Method to process and add contact
    String nombre = nom.text; // Obtiene el texto del nombre / Gets the name text
    String telefono = tel.text; // Obtiene el texto del teléfono / Gets the phone text
    
    if(nombre.isEmpty && telefono.isEmpty){ // Valida si ambos campos están vacíos / Validates if both fields are empty
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error, Faltan Datos'), // Mensaje de error si faltan datos / Error message if data is missing
        behavior: SnackBarBehavior.floating // Comportamiento flotante del SnackBar / Floating SnackBar behavior
        )
      );
    }else{
      setState(() {
        lista.insert(0, items(nombre, telefono)); // Inserta el nuevo contacto al inicio de la lista / Inserts new contact at the start of the list
      });
      Navigator.pop(context); // Cierra el cuadro de diálogo actual / Closes the current dialog box
      nom.clear(); // Limpia la caja de texto del nombre / Clears name text field
      tel.clear(); // Limpia la caja de texto del teléfono / Clears phone text field
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Datos Agregados'), // Mensaje de éxito al agregar / Success message on add
        behavior: SnackBarBehavior.floating // Comportamiento flotante del SnackBar / Floating SnackBar behavior
        )
      );
    }

  }

  void _agregar(){ // Método para mostrar el cuadro de diálogo de registro / Method to show registration dialog
    showDialog(
      context: context, 
      builder: (context){
        return Dialog(
          child: Container(
            padding: EdgeInsets.all(30), // Relleno interno del contenedor / Internal container padding
            child: Column(
            mainAxisSize: MainAxisSize.min, // Ajusta el tamaño de la columna al contenido / Sizes column to content
            children: [
              Text("Agregar"), // Título del diálogo / Dialog title
              SizedBox(height: 25), // Espacio vertical de separación / Vertical separation space
              TextField(
                controller: nom, // Controlador asignado al campo de nombre / Controller assigned to name field
                decoration: InputDecoration(
                  border: OutlineInputBorder(), // Borde delineado del campo / Outlined field border
                  label: Text("Escribe el nombre") // Etiqueta flotante del campo / Field floating label
                ),
              ),
              SizedBox(height: 10), // Espacio vertical de separación / Vertical separation space
              TextField(
                controller: tel, // Controlador asignado al campo de teléfono / Controller assigned to phone field
                decoration: InputDecoration(
                  border: OutlineInputBorder(), // Borde delineado del campo / Outlined field border
                  label: Text("Escribe el telefono") // Etiqueta flotante del campo / Field floating label
                ),
              ),
              SizedBox(height: 10), // Espacio vertical de separación / Vertical separation space
              Container(
                width: double.infinity,
                child: TextButton(
                  onPressed: _boton, // Llama al método para procesar los datos / Calls method to process data
                  child: Text("Aceptar") // Texto del botón de confirmación / Confirmation button text
                ),
              )
            ],
          ),
          ),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreenAccent, // Color de fondo verde claro para la AppBar / Light green background color for AppBar
        title: Text(n,
          style: TextStyle(
            fontWeight: FontWeight.bold // Texto en negrita para el título / Bold text for title
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15), // Margen derecho para el botón / Right margin for button
            child: ElevatedButton.icon(
              onPressed: _agregar, // Llama al método para abrir el diálogo de agregar / Calls method to open add dialog
              label: Icon(Icons.add) // Icono de adición en el botón / Addition icon on button
              ),
          )
        ],
      ),
      body: Center( // Centra el contenido en pantalla / Centers content on screen
        child: Padding(
          padding: const EdgeInsets.all(20.0), // Relleno general de la vista / General view padding
          child: Card(
            elevation: 6, // Elevación de la tarjeta contenedora / Container card elevation
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6) // Bordes redondeados de la tarjeta / Card rounded corners
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0), // Relleno interno de la tarjeta / Card internal padding
              child: ListView.builder(
                itemCount: lista.length, // Define la cantidad de elementos en la lista / Defines number of items in list
                itemBuilder: (context, index) => Card(
                  child: ListTile(
                    leading: Image.asset('assets/img.png'), // Muestra una imagen local a la izquierda / Displays local image on the left
                    title: Text(lista[index].titulo), // Muestra el nombre guardado en la lista / Displays name saved in list
                    subtitle: Text(lista[index].subtitulo), // Muestra el teléfono guardado en la lista / Displays phone saved in list
                    onTap: (){
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(index.toString()), // Muestra el índice del elemento al hacer clic / Shows item index on click
                        behavior: SnackBarBehavior.floating // Comportamiento flotante del SnackBar / Floating SnackBar behavior
                        )
                      );
                    }
                  ),
                )
                ),
            ),
          ),
        ),
      ),
    );
  }
}