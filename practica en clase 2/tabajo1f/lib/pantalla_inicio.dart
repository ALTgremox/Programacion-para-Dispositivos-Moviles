// pantalla_inicio.dart
// Proyecto: tabajo1f
// Pantalla principal de bienvenida del usuario
// Autor: Hugo Díaz Chávez – Universidad La Salle (2025-II)

import 'package:flutter/material.dart';

// Clase principal que representa la pantalla de inicio.
// Es un StatelessWidget porque no necesita manejar cambios de estado.
class PantallaInicio extends StatelessWidget {
  const PantallaInicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold define la estructura visual básica de la pantalla
      appBar: AppBar(
        title: const Text('Bienvenido'), // Título de la AppBar
        centerTitle: true, // Centra el texto en la parte superior
      ),

      // El cuerpo de la pantalla
      body: Center(
        // Center centra su contenido en la pantalla
        child: Padding(
          // Padding agrega márgenes internos al contenido
          padding: const EdgeInsets.all(24.0),

          // Column organiza los elementos en una disposición vertical
          child: Column(
            mainAxisAlignment: MainAxisAlignment
                .center, // Centra los elementos en el eje vertical
            children: [
              // Texto principal de bienvenida
              const Text(
                '¡Hola! Bienvenido a mi aplicación personal 👋',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center, // Centra el texto horizontalmente
              ),

              const SizedBox(height: 20), // Espacio entre los textos

              // Texto descriptivo adicional
              const Text(
                'Aquí podrás conocer un poco más sobre mí, mis intereses y pasatiempos.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),

              const SizedBox(height: 30), // Espacio antes del botón

              // Botón con ícono que lleva a la pantalla de perfil
              ElevatedButton.icon(
                onPressed: () {
                  // Usa rutas nombradas para navegar a la pantalla de perfil
                  Navigator.pushNamed(context, '/perfil');
                },
                icon: const Icon(Icons.person), // Ícono del botón
                label: const Text('Ver mi perfil'), // Texto del botón
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal, // Color del botón
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 12,
                  ), // Tamaño del botón
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
