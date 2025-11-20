import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/user_view_model.dart';
import '../models/user.dart';
import 'user_form_screen.dart';

// Lista de usuarios con botón para filtrar activos.
class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  bool mostrarActivos = false; // filtro

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<UserViewModel>();

    final lista = mostrarActivos ? vm.usuariosActivos : vm.usuarios;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Usuarios'),
      ),

      body: Column(
        children: [
          // Filtro con Switch
          SwitchListTile(
            title: const Text("Mostrar solo usuarios activos"),
            value: mostrarActivos,
            onChanged: (v) => setState(() => mostrarActivos = v),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: lista.length,
              itemBuilder: (context, index) {
                final user = lista[index];

                return Card(
                  child: ListTile(
                    title: Text("${user.nombre} (${user.edad} años)"),
                    subtitle: Text("${user.genero} · ${user.correo}"),

                    // Se reemplazan iconos por texto simple.
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextButton(
                          child: const Text("Editar"),
                          onPressed: () async {
                            final actualizado = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => UserFormScreen(
                                  usuario: user,
                                  indice: vm.usuarios.indexOf(user),
                                ),
                              ),
                            );
                            if (actualizado != null && actualizado is User) {
                              vm.editarUsuario(
                                vm.usuarios.indexOf(user),
                                actualizado,
                              );
                            }
                          },
                        ),
                        TextButton(
                          child: const Text("Eliminar"),
                          onPressed: () => vm.eliminarUsuario(
                            vm.usuarios.indexOf(user),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final nuevo = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const UserFormScreen()),
          );

          if (nuevo != null && nuevo is User) {
            vm.agregarUsuario(nuevo);
          }
        },
        child: const Text("+"),
      ),
    );
  }
}
