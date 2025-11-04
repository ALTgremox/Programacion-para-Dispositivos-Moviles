// main.dart
// Proyecto: tabajo1f
// App personal con navegación entre pantallas (Inicio, Perfil, Hobbies)

import 'package:flutter/material.dart';
import 'pantalla_inicio.dart';
import 'pantalla_perfil.dart';
import 'pantalla_hobbies.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mi App Personal',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const PantallaInicio(),
        '/perfil': (context) => const PantallaPerfil(),
        '/hobbies': (context) => const PantallaHobbies(),
      },
    );
  }
}
