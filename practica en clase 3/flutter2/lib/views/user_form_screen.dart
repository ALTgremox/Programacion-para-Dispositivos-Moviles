import 'package:flutter/material.dart';
import '../models/user.dart';

// Formulario para agregar o editar usuario con validaciones.
class UserFormScreen extends StatefulWidget {
  final User? usuario;
  final int? indice;

  const UserFormScreen({super.key, this.usuario, this.indice});

  @override
  State<UserFormScreen> createState() => _UserFormScreenState();
}

class _UserFormScreenState extends State<UserFormScreen> {
  final _formKey = GlobalKey<FormState>();

  late String _nombre;
  late int _edad;
  late String _correo;
  String _genero = "Masculino";
  bool _activo = true;

  @override
  void initState() {
    super.initState();

    if (widget.usuario != null) {
      _nombre = widget.usuario!.nombre;
      _edad = widget.usuario!.edad;
      _correo = widget.usuario!.correo;
      _genero = widget.usuario!.genero;
      _activo = widget.usuario!.activo;
    } else {
      _nombre = "";
      _edad = 18;
      _correo = "";
    }
  }

  bool validarCorreo(String correo) {
    final exp = RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$');
    return exp.hasMatch(correo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.usuario == null ? "Agregar Usuario" : "Editar Usuario"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Nombre
              TextFormField(
                initialValue: _nombre,
                decoration: const InputDecoration(labelText: "Nombre"),
                validator: (v) =>
                v == null || v.isEmpty ? "El nombre es obligatorio" : null,
                onSaved: (v) => _nombre = v!,
              ),

              // Edad
              TextFormField(
                initialValue: "$_edad",
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "Edad"),
                validator: (v) {
                  if (v == null || v.isEmpty) return "Ingrese edad";
                  final valor = int.tryParse(v);
                  if (valor == null || valor <= 0) return "Edad inválida";
                  return null;
                },
                onSaved: (v) => _edad = int.parse(v!),
              ),

              // Correo
              TextFormField(
                initialValue: _correo,
                decoration: const InputDecoration(labelText: "Correo electrónico"),
                validator: (v) {
                  if (v == null || v.isEmpty) return "Ingrese un correo";
                  if (!validarCorreo(v)) return "Correo inválido";
                  return null;
                },
                onSaved: (v) => _correo = v!,
              ),

              const SizedBox(height: 20),
              const Text("Género"),

              // Radios de género
              Row(
                children: [
                  Expanded(
                    child: RadioListTile(
                      title: const Text("Masculino"),
                      value: "Masculino",
                      groupValue: _genero,
                      onChanged: (v) => setState(() => _genero = v!),
                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                      title: const Text("Femenino"),
                      value: "Femenino",
                      groupValue: _genero,
                      onChanged: (v) => setState(() => _genero = v!),
                    ),
                  ),
                ],
              ),

              // Activo
              SwitchListTile(
                title: const Text("Activo"),
                value: _activo,
                onChanged: (v) => setState(() => _activo = v),
              ),

              const SizedBox(height: 20),

              // Botón guardar
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    final user = User(
                      nombre: _nombre,
                      genero: _genero,
                      activo: _activo,
                      edad: _edad,
                      correo: _correo,
                    );

                    Navigator.pop(context, user);
                  }
                },
                child: Text(widget.usuario == null ? "Guardar" : "Actualizar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
