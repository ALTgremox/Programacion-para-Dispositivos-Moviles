import 'package:flutter/material.dart';

class HobbyItem extends StatelessWidget {
  final IconData icon;
  final String texto;

  const HobbyItem({super.key, required this.icon, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(icon, color: Colors.teal, size: 30),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                texto,
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
