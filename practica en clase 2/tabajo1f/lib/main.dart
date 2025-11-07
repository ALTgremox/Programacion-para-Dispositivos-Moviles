// main.dart
// Proyecto: tabajo1f
// App personal con navegación inferior (BottomNavigationBar)
// Autor: Hugo Díaz Chávez – Universidad La Salle (2025-II)

import 'package:flutter/material.dart';
// Importación de las pantallas principales de la aplicación
import 'pantalla_inicio.dart';
import 'pantalla_perfil.dart';
import 'pantalla_hobbies.dart';
import 'pantalla_config.dart';

// Función principal: punto de entrada de la aplicación
void main() {
  runApp(const MyApp());
}

// Widget raíz de la aplicación
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Quita la etiqueta "Debug" del simulador
      title: 'Mi App Personal', // Título general de la app
      theme: ThemeData(
        primarySwatch: Colors.teal, // Color principal del tema
        scaffoldBackgroundColor: Colors.grey[100], // Fondo base para las pantallas
      ),
      home: const NavegacionPrincipal(), // Pantalla inicial de la app
    );
  }
}

// Widget principal que controla la barra de navegación inferior
class NavegacionPrincipal extends StatefulWidget {
  const NavegacionPrincipal({super.key});

  @override
  State<NavegacionPrincipal> createState() => _NavegacionPrincipalState();
}

class _NavegacionPrincipalState extends State<NavegacionPrincipal> {
  // Índice de la pestaña seleccionada actualmente
  int _selectedIndex = 0;

  // Variable que almacena el nombre del usuario (editable desde Perfil)
  String _nombreUsuario = 'Hugo Díaz Chávez';

  // Función que actualiza el índice cuando se selecciona un ítem del menú
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Lista que almacenará las pantallas (páginas) principales
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    // Inicialización de las páginas que aparecerán en la barra inferior
    _pages = [
      const PantallaInicio(), // Pestaña de inicio (pantalla de bienvenida)
      PantallaPerfil(
        nombreUsuario: _nombreUsuario,
        onActualizarNombre: (nuevoNombre) {
          // Permite actualizar el nombre del usuario desde la pantalla "Editar perfil"
          setState(() {
            _nombreUsuario = nuevoNombre;
          });
        },
      ),
      const PantallaHobbies(), // Pestaña de hobbies
      const PantallaConfig(), // Pestaña de configuración
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Muestra la pantalla seleccionada según el índice
      // IndexedStack mantiene el estado de las pantallas (no las reinicia al cambiar de pestaña)
      body: IndexedStack(index: _selectedIndex, children: _pages),

      // Barra de navegación inferior
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // Índice actual seleccionado
        selectedItemColor: Colors.teal, // Color del ícono seleccionado
        unselectedItemColor: Colors.grey, // Color de íconos no seleccionados
        onTap: _onItemTapped, // Acción al tocar cada ícono
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Hobbies',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Config',
          ),
        ],
      ),
    );
  }
}
