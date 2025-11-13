import 'package:flutter/material.dart';
import '../models/user.dart';

/// ViewModel encargado de manejar la lógica del CRUD de usuarios.
/// Utiliza ChangeNotifier para notificar a la UI cuando hay cambios
/// y así actualizar automáticamente los widgets que lo escuchan.
class UserViewModel extends ChangeNotifier {
  /// Lista privada que contiene todos los usuarios registrados.
  final List<User> _usuarios = [];

  /// Variable que controla si debe mostrarse solo usuarios activos.
  bool _mostrarSoloActivos = false;

  /// Getter que retorna la lista de usuarios dependiendo del filtro.
  ///
  /// Si [_mostrarSoloActivos] es true, retorna solo los usuarios cuyo
  /// campo [activo] sea true.
  ///
  /// Si es false, retorna la lista completa.
  List<User> get usuarios {
    if (_mostrarSoloActivos) {
      return _usuarios.where((u) => u.activo).toList();
    }
    return _usuarios;
  }

  /// Getter que expone el estado del filtro de usuarios activos.
  bool get mostrarSoloActivos => _mostrarSoloActivos;

  /// Cambia el valor del filtro de usuarios activos.
  /// Notifica a los listeners para que la UI se actualice.
  void cambiarFiltro(bool value) {
    _mostrarSoloActivos = value;
    notifyListeners();
  }

  /// Agrega un nuevo usuario a la lista.
  /// Llama a notifyListeners() para que la UI se actualice automáticamente.
  void agregarUsuario(User usuario) {
    _usuarios.add(usuario);
    notifyListeners();
  }

  /// Edita un usuario existente según su [index].
  /// Reemplaza el usuario en la posición indicada.
  void editarUsuario(int index, User usuario) {
    _usuarios[index] = usuario;
    notifyListeners();
  }

  /// Elimina un usuario de la lista según su posición [index].
  /// Luego notifica cambios para actualizar la interfaz.
  void eliminarUsuario(int index) {
    _usuarios.removeAt(index);
    notifyListeners();
  }
}
