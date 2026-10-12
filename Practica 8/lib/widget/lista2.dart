import 'package:flutter/material.dart'; // Importa el paquete Material UI de Flutter / Imports Flutter Material UI package

class Lista2 extends StatefulWidget{ // Define un StatefulWidget para la lista interactiva / Defines a StatefulWidget for the interactive list
  @override
  State<StatefulWidget> createState() {
    return Clase2(); // Retorna la clase de estado / Returns the state class
  }
}

class Item{ // Clase modelo para representar un producto / Model class to represent a product
  final String titulo; // Título o nombre del producto / Product title or name
  final String subtitulo; // Precio o subtítulo del producto / Product price or subtitle
  Item(this.titulo,this.subtitulo); // Constructor para inicializar los datos / Constructor to initialize data
}

class Clase2 extends State<Lista2>{ // Clase de estado que gestiona la lógica de la vista / State class managing view logic

  TextEditingController producto =  TextEditingController(); // Controlador para el campo de texto del producto / Controller for product text field
  TextEditingController precio =  TextEditingController(); // Controlador para el campo de texto del precio / Controller for price text field
  
  final List <Item> items = [ // Lista inicial con elementos de ejemplo / Initial list with sample items
    Item('Jabon','\$120.00'), // Producto inicial Jabón / Initial soap product
    Item('Agua','\$10.00'), // Producto inicial Agua / Initial water product
    Item('Sal','\$20.00'), // Producto inicial Sal / Initial salt product
  ];

  void _MostrarDatos(String nombre, String precioindex){ // Método para mostrar un diálogo con los detalles del producto / Method to show a dialog with product details
    print(nombre+' '+precioindex); // Imprime el nombre y precio en consola / Prints name and price to console
    showDialog(
      context: context, 
      builder: (BuildContext context){
        return Dialog(
          backgroundColor: Colors.transparent, // Fondo transparente para el diálogo / Transparent background for dialog
          child: Container(
            padding: EdgeInsets.all(24), // Espaciado interno de la ventana emergente / Internal popup padding
            decoration: BoxDecoration(
              color: Colors.white, // Color de fondo blanco / White background color
              borderRadius: BorderRadius.circular(15) // Bordes redondeados del cuadro / Rounded box corners
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min, // Ajusta el tamaño de la columna al contenido / Sizes column to content
              children: [
                Container(
                  width: 100, // Ancho fijo del contenedor del icono / Fixed icon container width
                  height: 100, // Alto fijo del contenedor del icono / Fixed icon container height
                  decoration: BoxDecoration(
                    color: Colors.grey, // Fondo gris para el contenedor circular / Gray background for circular container
                    shape: BoxShape.circle // Forma circular del contenedor / Circular container shape
                  ),
                  child: Icon(
                    Icons.shopping_bag, // Icono de bolsa de compras / Shopping bag icon
                    color: Colors.blue, // Color azul para el icono / Blue color for icon
                    size: 40, // Tamaño del icono / Icon size
                  ),
                ),
                SizedBox(height: 10), // Espaciador vertical / Vertical spacer
                Text(nombre, style: TextStyle(
                  fontWeight: FontWeight.bold, // Texto en negrita para el nombre / Bold text for name
                  fontSize: 25 // Tamaño de fuente grande / Large font size
                ),
                ),
                SizedBox(height: 10), // Espaciador vertical / Vertical spacer
                Text(precioindex, style: TextStyle(
                  fontWeight: FontWeight.bold, // Texto en negrita para el precio / Bold text for price
                  fontSize: 22 // Tamaño de fuente del precio / Price font size
                  ),
                  ),
                SizedBox(height: 10), // Espaciador vertical / Vertical spacer
                Container(
                  child: SizedBox(
                    width: double.infinity, // Ancho máximo disponible / Maximum available width
                    child: ElevatedButton(
                      onPressed: (){
                        Navigator.pop(context); // Cierra la ventana de diálogo / Closes the dialog window
                      }, 
                      child: Text("Cerrar",
                      style: TextStyle(
                        fontWeight: FontWeight.bold, // Texto en negrita para el botón / Bold text for button
                        fontSize: 24 // Tamaño de fuente del botón / Button font size
                      ),
                      )
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }
    );

  }

  void _agregar(){ // Método para registrar un nuevo producto / Method to register a new product
    String p = producto.text; // Obtiene el texto escrito en el campo de producto / Gets text written in product field
    String pr = precio.text; // Obtiene el texto escrito en el campo de precio / Gets text written in price field

    if(p.isNotEmpty && pr.isNotEmpty){ // Verifica que ambos campos tengan contenido / Verifies both fields have content
      setState(() {
        items.insert(
          0, Item(p, '\$$pr') // Inserta el nuevo producto al inicio de la lista / Inserts new product at the start of the list
          );
      });
      producto.clear(); // Limpia la caja de texto del producto / Clears product text field
      precio.clear(); // Limpia la caja de texto del precio / Clears price text field
      FocusScope.of(context).unfocus(); // Ocultar el teclado / Hides virtual keyboard
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Producto Agregado'), // Mensaje emergente de éxito / Success toast message
        behavior: SnackBarBehavior.floating // Comportamiento flotante del SnackBar / Floating SnackBar behavior
        )
      );
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Completa los datos'), // Mensaje de advertencia si faltan datos / Warning message if data is missing
        behavior: SnackBarBehavior.floating // Comportamiento flotante del SnackBar / Floating SnackBar behavior
        )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent, // Color de fondo de la barra superior / AppBar background color
        title: Text(
          "Practica de Listas",
          style: TextStyle(
            color: Colors.white // Color de texto blanco / White text color
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 18), // Margen derecho para el contador / Right margin for counter
            child: Center(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12, // Relleno horizontal interno / Internal horizontal padding
                  vertical: 8 // Relleno vertical interno / Internal vertical padding
                ),
                decoration: BoxDecoration(
                  color: Colors.white, // Fondo blanco para el indicador / White background for indicator
                  borderRadius: BorderRadius.circular(5) // Bordes ligeramente redondeados / Slightly rounded corners
                ),
                child: Text(
                  '${items.length} productos', // Muestra la cantidad total de productos / Displays total number of products
                  style: TextStyle(
                    fontWeight: FontWeight.bold // Texto en negrita para el contador / Bold text for counter
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0), // Relleno general del cuerpo / General body padding
        child: Padding(
          padding: const EdgeInsets.all(8.0), // Relleno interno adicional / Additional internal padding
          child: Column(
            children: [
              Container(
                width: double.infinity,
                child: Card(
                  elevation: 8, // Sombreelevado de la tarjeta de entrada / Elevated shadow for input card
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8) // Bordes redondeados de la tarjeta / Card rounded corners
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0), // Relleno interno de la tarjeta / Card internal padding
                    child: Column(
                      children: [
                        TextField(
                          controller: producto, // Controlador asignado al campo de producto / Controller assigned to product field
                          decoration: InputDecoration(
                            labelText: 'Escribe el producto' // Texto guía del campo / Field placeholder text
                          ),
                        ),
                        TextField(
                          controller: precio, // Controlador asignado al campo de precio / Controller assigned to price field
                          decoration: InputDecoration(
                            labelText: 'Escribe el precio' // Texto guía del campo / Field placeholder text
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: _agregar, // Llama al método para agregar elemento / Calls method to add item
                            label: Text("Agregar"), // Texto del botón / Button text
                            icon: Icon(Icons.add), // Icono del botón / Button icon
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: items.length, // Define la longitud total de la lista / Defines total list length
                    itemBuilder: (context, index) =>Card(
                      child: ListTile(
                        leading: Icon(Icons.list), // Icono a la izquierda de la fila / Leading row icon
                        /*title: Text("Lista"),
                        subtitle: Text("Subtitulo de la lista"),*/
                        title: Text(items[index].titulo), // Muestra el título del producto actual / Displays current product title
                        subtitle: Text(items[index].subtitulo), // Muestra el precio del producto actual / Displays current product price
                        trailing: Icon(Icons.add), // Icono a la derecha de la fila / Trailing row icon
                        onTap: (){
                          _MostrarDatos(items[index].titulo, items[index].subtitulo); // Muestra el diálogo al hacer clic / Shows dialog on click
                        },
                      ),
                    )
                    ),
                ),
              ),
              /*FloatingActionButton(
                onPressed: (){},
                child: Icon(Icons.add),
              )*/
            ],
          ),
        ),
      ),
    );
  }
}