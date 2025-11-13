/// Modelo que representa a un usuario dentro de la aplicación.
/// Contiene información personal y de estado.
class User {
  /// Nombre completo del usuario.
  String nombre;

  /// Edad del usuario en años.
  int edad;

  /// Correo electrónico del usuario.
  String correo;

  /// Género del usuario.
  String genero;

  /// Indica si el usuario se encuentra activo en el sistema.
  bool activo;

  /// Constructor que inicializa los campos obligatorios del usuario.
  User({
    required this.nombre,
    required this.edad,
    required this.correo,
    required this.genero,
    required this.activo,
  });
}
