import 'package:flutter/material.dart'; // Importa el paquete Material UI de Flutter / Imports Flutter Material UI package
import 'package:practica11/widget/lista.dart'; // Importa el widget de lista personalizado / Imports custom list widget

class Datos extends StatefulWidget { // Define un StatefulWidget para capturar datos / Defines a StatefulWidget to capture data
  const Datos({super.key});
  @override
  State<StatefulWidget> createState() {
    return _DatosState(); // Retorna la clase de estado / Returns the state class
  }
}

class item{ // Clase modelo para representar el producto / Model class to represent the product
  final String producto; // Nombre del producto / Product name
  final String descripcion; // Descripción del producto / Product description
  final String precio; // Precio del producto / Product price
  item(this.producto,this.descripcion,this.precio); // Constructor para inicializar el ítem / Constructor to initialize the item
}

class _DatosState extends State<Datos>{ // Clase de estado que gestiona los controladores y la lista / State class managing controllers and list
  TextEditingController pro = TextEditingController(); // Controlador para el campo de producto / Controller for product field
  TextEditingController des = TextEditingController(); // Controlador para el campo de descripción / Controller for description field
  TextEditingController pre = TextEditingController(); // Controlador para el campo de precio / Controller for price field

  List <item> items = []; // Lista para almacenar los elementos agregados / List to store added items

  void _agregar(){ // Método para validar y agregar un elemento a la lista / Method to validate and add an item to the list
    setState(() {
      String p = pro.text; // Obtiene el texto del producto / Gets product text
      String d = des.text; // Obtiene el texto de la descripción / Gets description text
      String pr = pre.text; // Obtiene el texto del precio / Gets price text
      if(p.isNotEmpty && d.isNotEmpty && pr.isNotEmpty){ // Verifica que ningún campo esté vacío / Verifies no field is empty
        items.add(item(p, d, pr)); // Añade el nuevo ítem a la lista / Adds new item to the list
        pro.clear(); // Limpia el campo de producto / Clears product field
        des.clear(); // Limpia el campo de descripción / Clears description field
        pre.clear(); // Limpia el campo de precio / Clears price field
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Datos agregados a la lista")) // Mensaje flotante de éxito / Success toast message
        );
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Faltan Datos")) // Mensaje de advertencia si faltan datos / Warning message if data is missing
        );
      }
    });
  }

  void _enviar() async{ // Método asíncrono para navegar a la vista de lista / Async method to navigate to list view
    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (context) => Lista(
          items : items // Pasa la lista de elementos al siguiente widget / Passes items list to the next widget
        )
      )
    );
    setState(() {}); // Actualiza el estado al regresar / Updates state upon return
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Datos'), // Título de la AppBar / AppBar title
        backgroundColor: Colors.lightGreen, // Color de fondo verde claro / Light green background color
        actions: [
          IconButton(
            onPressed: _enviar, // Llama al método para enviar los datos a la otra vista / Calls method to send data to other view
            icon: Icon(Icons.list) // Icono de lista en la barra superior / List icon in top bar
          )
        ],
      ),
      body: Center( // Centra el contenido en pantalla / Centers content on screen
        child: Padding(
          padding: EdgeInsets.all(20), // Relleno general / General padding
          child: Card(
            elevation: 8, // Sombreelevado de la tarjeta / Elevated card shadow
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5) // Bordes redondeados de la tarjeta / Card rounded corners
            ),
            child: Padding(
              padding: const EdgeInsets.all(15), // Relleno interno de la tarjeta / Card internal padding
              child: Column(
                mainAxisSize: MainAxisSize.max, // Ocupa el máximo espacio disponible / Takes maximum available space
                children: [
                  TextField(
                    controller: pro, // Controlador asignado al campo de producto / Controller assigned to product field
                    decoration: InputDecoration(
                      labelText: "Escribe el producto", // Texto flotante del campo / Field floating label
                      border: OutlineInputBorder() // Borde delineado del campo / Outlined field border
                    ),
                  ),
                  TextField(
                    controller: des, // Controlador asignado al campo de descripción / Controller assigned to description field
                    decoration: InputDecoration(
                      labelText: "Escribe la descripcion", // Texto flotante del campo / Field floating label
                      border: OutlineInputBorder() // Borde delineado del campo / Outlined field border
                    ),
                  ),
                  TextField(
                    controller: pre, // Controlador asignado al campo de precio / Controller assigned to price field
                    decoration: InputDecoration(
                      labelText: "Escribe el precio", // Texto flotante del campo / Field floating label
                      border: OutlineInputBorder() // Borde delineado del campo / Outlined field border
                    ),
                  ),
                  SizedBox(height: 20), // Espacio vertical de separación / Vertical separation space
                  SizedBox(
                    width: double.infinity, // Ancho máximo del botón / Maximum button width
                    child: ElevatedButton.icon(
                      onPressed: _agregar, // Llama al método para agregar los datos / Calls method to add data
                      label: Text("Agregar") // Texto del botón / Button text
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}