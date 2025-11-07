// pantalla_editar_perfil.dart
// Proyecto: tabajo1f
// Pantalla para editar el nombre del usuario y devolverlo a la pantalla de perfil
// Autor: Hugo Díaz Chávez – Universidad La Salle (2025-II)

import 'package:flutter/material.dart';

// Widget principal que representa la pantalla de edición de perfil.
// Se usa un StatefulWidget porque el contenido (el texto del campo) puede cambiar.
class EditarPerfilScreen extends StatefulWidget {
  const EditarPerfilScreen({super.key});

  @override
  State<EditarPerfilScreen> createState() => _EditarPerfilScreenState();
}

class _EditarPerfilScreenState extends State<EditarPerfilScreen> {
  // Controlador del campo de texto. Permite obtener el valor ingresado por el usuario.
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar con el título superior de la pantalla
      appBar: AppBar(
        title: const Text('Editar perfil'),
        centerTitle: true,
      ),

      // Cuerpo principal de la pantalla con margen interno (Padding)
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          // Los widgets se apilan verticalmente
          children: [
            // Campo de texto donde el usuario ingresa su nombre
            TextField(
              controller: _controller, // Conecta el campo con el controlador
              decoration: const InputDecoration(
                labelText: 'Nombre', // Texto guía sobre el campo
                border: OutlineInputBorder(), // Borde visible del campo
              ),
            ),

            const SizedBox(height: 20), // Espacio entre el campo y el botón

            // Botón que guarda el nuevo nombre y regresa a la pantalla anterior
            ElevatedButton(
              onPressed: () {
                // Navigator.pop regresa al contexto anterior enviando el texto escrito
                // Esto permite devolver el valor al widget que llamó esta pantalla
                Navigator.pop(context, _controller.text);
              },
              child: const Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}
