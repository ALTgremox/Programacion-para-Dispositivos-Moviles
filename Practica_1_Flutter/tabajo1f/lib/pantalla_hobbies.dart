import 'package:flutter/material.dart';
import 'widgets/hobby_item.dart';

class PantallaHobbies extends StatelessWidget {
  const PantallaHobbies({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Hobbies'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: const [
          HobbyItem(icon: Icons.sports_volleyball, texto: 'Jugar Voley.'),
          HobbyItem(icon: Icons.sports_esports, texto: 'Jugar videojuegos.'),
          HobbyItem(icon: Icons.music_note, texto: 'Escuchar música.'),
          HobbyItem(icon: Icons.travel_explore, texto: 'Viajar y conocer lugares nuevos.'),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pop(context); // volver a la pantalla anterior
        },
        label: const Text('Volver'),
        icon: const Icon(Icons.arrow_back),
        backgroundColor: Colors.teal,
      ),
    );
  }
}
