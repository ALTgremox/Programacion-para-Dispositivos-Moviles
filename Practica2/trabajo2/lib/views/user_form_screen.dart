import 'package:flutter/material.dart';
import '../models/user.dart';

/// Pantalla encargada de mostrar el formulario de creación o edición de un usuario.
/// Si [usuario] viene con datos, se trata de una edición; si no, es un registro nuevo.
class UserFormScreen extends StatefulWidget {
  /// Usuario existente a editar. Si es null, el formulario funciona en modo "Agregar".
  final User? usuario;

  /// Índice del usuario en la lista (solo para edición). No siempre es necesario.
  final int? indice;

  const UserFormScreen({super.key, this.usuario, this.indice});

  @override
  State<UserFormScreen> createState() => _UserFormScreenState();
}

class _UserFormScreenState extends State<UserFormScreen> {
  /// Clave del formulario para validar y guardar datos.
  final _formKey = GlobalKey<FormState>();

  // Variables internas del formulario.
  late String _nombre;
  late int _edad;
  late String _correo;
  String _genero = 'Masculino';
  bool _activo = true;

  /// Inicializa los datos según si es edición o creación de usuario.
  @override
  void initState() {
    super.initState();

    if (widget.usuario != null) {
      // Modo edición: cargar valores del usuario.
      _nombre = widget.usuario!.nombre;
      _edad = widget.usuario!.edad;
      _correo = widget.usuario!.correo;
      _genero = widget.usuario!.genero;
      _activo = widget.usuario!.activo;
    } else {
      // Modo registro: valores por defecto.
      _nombre = '';
      _edad = 0;
      _correo = '';
    }
  }

  /// Valida el formato del correo usando RegExp.
  bool emailValido(String email) {
    final regex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
    return regex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Título dinámico: cambiar entre agregar o editar usuario.
        title: Text(widget.usuario == null ? 'Agregar Usuario' : 'Editar Usuario'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, // Vincular formulario.
          child: ListView(
            children: [
              /// Campo: Nombre
              TextFormField(
                initialValue: _nombre,
                decoration: const InputDecoration(labelText: 'Nombre'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'El nombre no puede estar vacío';
                  }
                  return null;
                },
                onSaved: (value) => _nombre = value!,
              ),

              /// Campo: Edad
              TextFormField(
                initialValue: _edad == 0 ? '' : _edad.toString(),
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Edad'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese una edad válida';
                  }
                  final edad = int.tryParse(value);
                  if (edad == null || edad <= 0) {
                    return 'La edad debe ser mayor a 0';
                  }
                  return null;
                },
                onSaved: (value) => _edad = int.parse(value!),
              ),

              /// Campo: Correo
              TextFormField(
                initialValue: _correo,
                decoration: const InputDecoration(labelText: 'Correo electrónico'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'El correo no puede estar vacío';
                  }
                  if (!emailValido(value)) {
                    return 'Ingrese un correo válido';
                  }
                  return null;
                },
                onSaved: (value) => _correo = value!,
              ),

              const SizedBox(height: 20),

              /// Campo: Género (Radio Buttons)
              const Text('Género'),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile(
                      title: const Text('Masculino'),
                      value: 'Masculino',
                      groupValue: _genero,
                      onChanged: (value) => setState(() => _genero = value!),
                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                      title: const Text('Femenino'),
                      value: 'Femenino',
                      groupValue: _genero,
                      onChanged: (value) => setState(() => _genero = value!),
                    ),
                  ),
                ],
              ),

              /// Campo: Activo (Switch)
              SwitchListTile(
                title: const Text('Activo'),
                value: _activo,
                onChanged: (value) => setState(() => _activo = value),
              ),

              const SizedBox(height: 30),

              /// Botón para guardar o actualizar
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    /// Crear instancia del usuario con los datos ingresados.
                    final user = User(
                      nombre: _nombre,
                      edad: _edad,
                      correo: _correo,
                      genero: _genero,
                      activo: _activo,
                    );

                    /// Retornar el usuario a la pantalla anterior.
                    Navigator.pop(context, user);
                  }
                },
                child: Text(widget.usuario == null ? 'Guardar' : 'Actualizar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
