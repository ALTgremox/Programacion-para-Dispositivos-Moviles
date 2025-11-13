import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodels/user_view_model.dart';
import 'views/user_list_screen.dart';

/// Punto de entrada principal de la aplicación.
/// Aquí se inicializa Flutter y se configura Provider como
/// gestor global del estado de la app.
void main() {
  runApp(
    /// ChangeNotifierProvider permite que todo el árbol de widgets
    /// tenga acceso al UserViewModel y escuche cambios en tiempo real.
    ChangeNotifierProvider(
      create: (_) => UserViewModel(),
      child: const MyApp(),
    ),
  );
}

/// Widget raíz de la aplicación.
/// Configura el tema visual, título y pantalla principal.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /// Título general de la aplicación.
      title: 'Gestión de Usuarios',

      /// Ocultar banner de modo debug.
      debugShowCheckedModeBanner: false,

      /// Tema visual de la app.
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        useMaterial3: false, // Desactiva Material 3 para evitar cambios inesperados.
      ),

      /// Primera pantalla que verá el usuario.
      home: const UserListScreen(),
    );
  }
}
