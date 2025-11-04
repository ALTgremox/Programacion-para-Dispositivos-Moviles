import 'package:flutter/material.dart';

class PantallaPerfil extends StatelessWidget {
  const PantallaPerfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi Perfil'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.interests),
            tooltip: 'Mis hobbies',
            onPressed: () {
              Navigator.pushNamed(context, '/hobbies');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage('https://lh3.googleusercontent.com/a/ACg8ocKgaA9ENyPn_IJdQd_1ziCpwkW2-xRMkG3tdd_RzEFGLVFfBns=s504-c-no'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Hugo Díaz Chávez',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Estudiante de Ingeniería de Software',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const Divider(height: 40, thickness: 1),
            infoRow(Icons.email, 'hdiazc@elasalle.edu.pe'),
            infoRow(Icons.phone, '+51 925 777 837'),
            infoRow(Icons.location_on, 'Arequipa, Perú'),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context); // volver a la pantalla anterior
              },
              icon: const Icon(Icons.arrow_back),
              label: const Text('Volver al inicio'),
            ),
          ],
        ),
      ),
    );
  }

  static Widget infoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.teal),
          const SizedBox(width: 10),
          Text(text, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
