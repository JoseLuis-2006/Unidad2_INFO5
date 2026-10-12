import 'package:flutter/material.dart'; // Importa el paquete Material UI de Flutter / Imports Flutter Material UI package
import 'datos.dart'; // Importa el archivo de datos para acceder al modelo item / Imports data file to access item model
class Lista extends StatefulWidget{ // Define un StatefulWidget para mostrar la lista / Defines a StatefulWidget to display the list
  final List<item> items; // Variable final que recibe la lista de productos / Final variable receiving the products list
  const Lista({super.key,required this.items}); // Constructor con parámetro obligatorio de la lista / Constructor with required list parameter
  @override
  State<StatefulWidget> createState() {
    return _ListaState(); // Retorna la clase de estado / Returns the state class
  }
}

class _ListaState extends State <Lista>{ // Clase de estado para la lista de productos / State class for products list
  @override
  Widget build(BuildContext context) {
    final items = widget.items; // Obtiene la lista de elementos recibida / Gets the received items list
    return Scaffold( // Estructura visual principal de la pantalla / Main screen visual layout
      appBar: AppBar( // Barra superior de navegación / Top navigation app bar
        title: Text("Lista de Productos"), // Título de la AppBar / AppBar title
        backgroundColor: Colors.lightGreen, // Color de fondo verde claro / Light green background color
      ),
      body: items.isEmpty // Valida si la lista está vacía / Validates if the list is empty
      ? Center( // Centra el contenido en pantalla / Centers content on screen
        child: Text(
          "Lista vacia", // Mensaje cuando la lista no tiene elementos / Message when list has no items
          style: TextStyle(
            color: Colors.red // Color rojo para el texto de advertencia / Red color for warning text
            ),
            )
        )
      : Center( // Centra la lista si contiene elementos / Centers list if it contains items
        child: Padding(
          padding: EdgeInsets.all(15), // Relleno general para la lista / General padding for the list
          child: ListView.builder( // Constructor eficiente para listas dinámicas / Efficient builder for dynamic lists
            itemCount: items.length, // Define la cantidad total de elementos / Defines total number of items
            itemBuilder: (context, index){
              final item = items[index]; // Obtiene el elemento actual de la lista / Gets current item from the list
              return Card( // Tarjeta contenedora para cada producto / Container card for each product
                margin: EdgeInsets.all(10), // Margen exterior de la tarjeta / Card external margin
              child: 
              ListTile( // Estructura de elemento de lista / List tile layout structure
                leading: Icon(Icons.production_quantity_limits), // Icono indicador de productos / Product indicator icon
                title: Text(item.producto), // Muestra el nombre del producto / Displays product name
                subtitle: Column( // Columna para mostrar la descripción y precio / Column to display description and price
                  children: [
                    Text(item.descripcion), // Muestra la descripción del producto / Displays product description
                    Text('Precio ${item.precio}') // Muestra el precio formateado / Displays formatted price
                  ],
                ),
                trailing: IconButton( // Botón de acción a la derecha (eliminar) / Action button on the right (delete)
                  color: Colors.red, // Color rojo para el botón de eliminar / Red color for delete button
                  onPressed: (){
                    setState(() {
                      items.removeAt(index); // Elimina el elemento de la lista por su índice / Removes item from list by index
                    });
                  }, 
                  icon: Icon(Icons.delete) // Icono de papelera para eliminar / Trash can icon to delete
                ),
              )
              );
            }
            )
          ),
        ),
      );
  }
}