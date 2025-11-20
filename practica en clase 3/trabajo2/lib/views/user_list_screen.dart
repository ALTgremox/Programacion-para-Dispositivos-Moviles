import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/user_view_model.dart';
import '../models/user.dart';
import 'user_form_screen.dart';

/// Pantalla principal que muestra la lista de usuarios.
/// Permite agregar, editar y eliminar usuarios, además de filtrar por estado activo.
class UserListScreen extends StatelessWidget {
  final String email;

  const UserListScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<UserViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido: $email'),
        actions: [
          Row(
            children: [
              const Text("Solo activos"),
              Switch(
                value: viewModel.mostrarSoloActivos,
                onChanged: (value) => viewModel.cambiarFiltro(value),
              ),
            ],
          )
        ],
      ),


      /// Lista dinámica de usuarios usando ListView.builder.
      body: ListView.builder(
        itemCount: viewModel.usuarios.length,
        itemBuilder: (context, index) {
          final user = viewModel.usuarios[index];

          return Card(
            child: ListTile(
              /// Título con nombre + edad del usuario
              title: Text("${user.nombre} (Edad: ${user.edad})"),

              /// Subtítulo con correo y estado del usuario
              subtitle: Text(
                "${user.correo}\n${user.genero} - ${user.activo ? 'Activo' : 'Inactivo'}",
              ),
              isThreeLine: true,

              /// Botones de acción: editar y eliminar
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  /// Botón para editar usuario
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () async {
                      /// Navega al formulario y espera la respuesta
                      final actualizado = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => UserFormScreen(
                            usuario: user,
                            indice: index,
                          ),
                        ),
                      );

                      /// Si el usuario fue modificado, actualizarlo en el ViewModel
                      if (actualizado != null && actualizado is User) {
                        viewModel.editarUsuario(index, actualizado);
                      }
                    },
                  ),

                  /// Botón para eliminar usuario
                  IconButton(
                    icon: const Icon(Icons.backspace),
                    onPressed: () => viewModel.eliminarUsuario(index),
                  ),
                ],
              ),
            ),
          );
        },
      ),

      /// Botón flotante para agregar nuevos usuarios
      floatingActionButton: SizedBox(
        width: 60,
        height: 60,
        child: FloatingActionButton(
          onPressed: () async {
            /// Abrir formulario en modo "Agregar"
            final nuevoUsuario = await Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const UserFormScreen()),
            );

            /// Si retornó un usuario, agregarlo a la lista
            if (nuevoUsuario != null && nuevoUsuario is User) {
              viewModel.agregarUsuario(nuevoUsuario);
            }
          },

          /// Texto "+" como ícono personalizado
          child: const Text(
            '+',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
