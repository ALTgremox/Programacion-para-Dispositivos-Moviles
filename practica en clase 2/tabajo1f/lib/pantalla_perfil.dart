// pantalla_perfil.dart
// Proyecto: tabajo1f
// Pantalla de perfil del usuario con opción para editar su nombre
// Autor: Hugo Díaz Chávez – Universidad La Salle (2025-II)

import 'package:flutter/material.dart';
import 'pantalla_editar_perfil.dart'; // Pantalla que permite editar el nombre
import 'pantalla_hobbies.dart';       // Pantalla que muestra los hobbies del usuario

// Clase principal de la pantalla de perfil.
// Usa StatefulWidget porque el nombre del usuario puede cambiar dinámicamente.
class PantallaPerfil extends StatefulWidget {
  // Recibe el nombre actual del usuario y una función para actualizarlo
  final String nombreUsuario;
  final Function(String) onActualizarNombre;

  const PantallaPerfil({
    super.key,
    required this.nombreUsuario,
    required this.onActualizarNombre,
  });

  @override
  State<PantallaPerfil> createState() => _PantallaPerfilState();
}

class _PantallaPerfilState extends State<PantallaPerfil> {
  // Variable local que almacena temporalmente el nombre del usuario
  late String _nombreUsuario;

  @override
  void initState() {
    super.initState();
    // Se inicializa la variable local con el valor recibido desde el widget padre
    _nombreUsuario = widget.nombreUsuario;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar superior con título y acceso directo a los hobbies
      appBar: AppBar(
        title: const Text('Mi Perfil'),
        centerTitle: true,
        actions: [
          // Botón en la esquina derecha que lleva a la pantalla de Hobbies
          IconButton(
            icon: const Icon(Icons.interests),
            tooltip: 'Mis hobbies',
            onPressed: () {
              // Navega hacia la pantalla de hobbies usando Navigator.push
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PantallaHobbies()),
              );
            },
          ),
        ],
      ),

      // Cuerpo principal con desplazamiento (por si el contenido es largo)
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Imagen de perfil circular del usuario
            const CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(
                'https://lh3.googleusercontent.com/a/ACg8ocKgaA9ENyPn_IJdQd_1ziCpwkW2-xRMkG3tdd_RzEFGLVFfBns=s504-c-no',
              ),
            ),

            const SizedBox(height: 20),

            // Nombre del usuario (editable)
            Text(
              _nombreUsuario,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            // Descripción corta o título profesional
            const Text(
              'Estudiante de Ingeniería de Software',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),

            // Línea divisoria visual
            const Divider(height: 40, thickness: 1),

            // Información de contacto del usuario (correo, teléfono, ubicación)
            infoRow(Icons.email, 'hdiazc@elasalle.edu.pe'),
            infoRow(Icons.phone, '+51 925 777 837'),
            infoRow(Icons.location_on, 'Arequipa, Perú'),

            const SizedBox(height: 30),

            // Botón para editar el perfil
            ElevatedButton.icon(
              onPressed: () async {
                // Navega hacia la pantalla de edición de perfil y espera el resultado
                final nuevoNombre = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EditarPerfilScreen(),
                  ),
                );

                // Si se retorna un nombre válido, se actualiza el estado local y global
                if (nuevoNombre != null && nuevoNombre != '') {
                  setState(() {
                    _nombreUsuario = nuevoNombre;
                  });

                  // Llama a la función recibida desde el widget padre para actualizar globalmente
                  widget.onActualizarNombre(nuevoNombre);
                }
              },
              icon: const Icon(Icons.edit),
              label: const Text('Editar perfil'),
            ),
          ],
        ),
      ),
    );
  }

  // Método auxiliar que genera una fila con ícono y texto (para contacto)
  static Widget infoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.teal), // Ícono del dato (correo, teléfono, etc.)
          const SizedBox(width: 10),
          Text(text, style: const TextStyle(fontSize: 16)), // Texto del dato
        ],
      ),
    );
  }
}

