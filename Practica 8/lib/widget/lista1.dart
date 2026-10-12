import 'package:flutter/material.dart'; // Importa el paquete Material UI de Flutter / Imports Flutter Material UI package

class Lista1 extends StatefulWidget{ // Define un StatefulWidget para la lista / Defines a StatefulWidget for the list
  @override
  State<StatefulWidget> createState() {
    return Clase2(); // Retorna la instancia de estado asociada / Returns associated state instance
  }
}

class Item{ // Clase modelo para representar un elemento / Model class to represent an item
  final String titulo; // Título o nombre del artículo / Title or item name
  final String subtitulo; // Subtítulo o precio del artículo / Subtitle or item price
  Item(this.titulo,this.subtitulo); // Constructor para inicializar el ítem / Constructor to initialize the item
}

class Clase2 extends State<Lista1>{ // Clase de estado que gestiona los elementos de la lista / State class managing list items
  final List <Item> items = [ // Lista con los datos de ejemplo / List with sample data
    Item('Jabon','120.00'), // Elemento Jabón / Soap item
    Item('Agua','10.00'), // Elemento Agua / Water item
    Item('Sal','20.00'), // Elemento Sal / Salt item
    Item('Harina','150.00'), // Elemento Harina / Flour item
    Item('Refresco','200.00'), // Elemento Refresco / Soda item
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Estructura visual básica de la pantalla / Basic visual screen layout
      appBar: AppBar( // Barra superior de navegación / Top navigation app bar
        backgroundColor: Colors.indigoAccent, // Color de fondo de la AppBar / AppBar background color
        title: Text( // Widget de texto para el título / Text widget for the title
          "Practica de Listas", // Texto del título / Title text
          style: TextStyle( // Estilos para el texto / Styles for text
            color: Colors.white // Color blanco para el texto / White color for text
          ),
        ),
      ),
      body: ListView.builder( // Constructor eficiente para listas dinámicas / Efficient builder for dynamic lists
        itemCount: items.length, // Define la cantidad total de elementos / Defines total number of items
        itemBuilder: (context, index) =>Card( // Crea una tarjeta por cada elemento de la lista / Creates a card for each list item
          child: ListTile( // Estructura de elemento de lista / List tile layout structure
            leading: Icon(Icons.list), // Icono a la izquierda del elemento / Icon on the left of the item
            /*title: Text("Lista"),
            subtitle: Text("Subtitulo de la lista"),*/
            title: Text(items[index].titulo), // Muestra el título del ítem actual / Displays current item title
            subtitle: Text(items[index].subtitulo), // Muestra el subtítulo del ítem actual / Displays current item subtitle
            trailing: Icon(Icons.add), // Icono a la derecha del elemento / Icon on the right of the item
          ),
        )
        ),
    );
  }
}