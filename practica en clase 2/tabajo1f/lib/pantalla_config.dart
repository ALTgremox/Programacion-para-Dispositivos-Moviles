// pantalla_config.dart
// Proyecto: tabajo1f
// Pantalla de Configuración
// Autor: Hugo Díaz Chávez – Universidad La Salle (2025-II)

import 'package:flutter/material.dart';

// Clase principal que representa la pantalla de Configuración.
// Al ser una vista simple y estática, se usa un StatelessWidget.
class PantallaConfig extends StatelessWidget {
  const PantallaConfig({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold proporciona la estructura básica de la interfaz:
    // AppBar, Body, FloatingActionButton, etc.
    return Scaffold(
      // Barra superior con el título de la pantalla
      appBar: AppBar(
        title: const Text('Configuración'),
        centerTitle: true, // Centra el texto en la AppBar
      ),

      // Cuerpo principal del Scaffold
      body: const Center(
        // El widget Center centra su contenido tanto horizontal como verticalmente
        child: Text(
          // Mensaje temporal que indica futuras funcionalidades
          'Ajustes de la aplicación próximamente...',
          style: TextStyle(
            fontSize: 18, // Tamaño del texto
          ),
          textAlign: TextAlign.center, // Centra el texto en el eje horizontal
        ),
      ),
    );
  }
}
