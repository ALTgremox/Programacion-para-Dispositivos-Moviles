import 'package:flutter/material.dart';
import '../models/user.dart';

// ViewModel que administra la lista de usuarios.
class UserViewModel extends ChangeNotifier {
  final List<User> _usuarios = [];

  List<User> get usuarios => _usuarios;

  // Filtro: retorna solo usuarios activos.
  List<User> get usuariosActivos =>
      _usuarios.where((u) => u.activo == true).toList();

  void agregarUsuario(User usuario) {
    _usuarios.add(usuario);
    notifyListeners();
  }

  void editarUsuario(int index, User usuario) {
    _usuarios[index] = usuario;
    notifyListeners();
  }

  void eliminarUsuario(int index) {
    _usuarios.removeAt(index);
    notifyListeners();
  }
}
