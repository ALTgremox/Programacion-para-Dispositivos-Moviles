// Modelo del usuario con nuevos campos: edad y correo.
class User {
  String nombre;
  String genero;
  bool activo;
  int edad;
  String correo;

  User({
    required this.nombre,
    required this.genero,
    required this.activo,
    required this.edad,
    required this.correo,
  });
}
