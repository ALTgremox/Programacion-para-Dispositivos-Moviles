// pantalla_hobbies.dart
// Proyecto: tabajo1f
// Pantalla que muestra una lista de pasatiempos o intereses personales
// Autor: Hugo Díaz Chávez – Universidad La Salle (2025-II)

import 'package:flutter/material.dart';
// Importación del widget personalizado que representa cada hobby
import 'widgets/hobby_item.dart';

// Clase principal que representa la pantalla de Hobbies
// Se usa un StatelessWidget porque su contenido no cambia dinámicamente
class PantallaHobbies extends StatelessWidget {
  const PantallaHobbies({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Estructura principal de la pantalla
      appBar: AppBar(
        title: const Text('Mis Hobbies'), // Título superior
        centerTitle: true, // Centra el texto en la barra
      ),

      // Cuerpo de la pantalla con desplazamiento vertical
      body: ListView(
        padding: const EdgeInsets.all(20.0), // Margen interno general
        children: const [
          // Cada ítem representa un hobby y utiliza el widget personalizado HobbyItem
          HobbyItem(icon: Icons.sports_volleyball, texto: 'Jugar Voley.'),
          HobbyItem(icon: Icons.sports_esports, texto: 'Jugar videojuegos.'),
          HobbyItem(icon: Icons.music_note, texto: 'Escuchar música.'),
          HobbyItem(icon: Icons.travel_explore, texto: 'Viajar y conocer lugares nuevos.'),
        ],
      ),
    );
  }
}
