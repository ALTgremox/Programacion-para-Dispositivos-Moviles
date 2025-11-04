// test/tabajo1f_test.dart
// Prueba básica del proyecto tabajo1f para verificar que Flutter y el árbol de widgets se cargan correctamente.

import 'package:flutter_test/flutter_test.dart';
import 'package:tabajo1f/main.dart';

void main() {
  // Grupo de pruebas para la aplicación principal
  group('Pruebas básicas de tabajo1f', () {
    testWidgets('La aplicación muestra el título Bienvenido en la pantalla de inicio',
            (WidgetTester tester) async {
          // Cargar el widget principal MyApp
          await tester.pumpWidget(const MyApp());

          // Buscar el texto 'Bienvenido' en el árbol de widgets
          expect(find.text('Bienvenido'), findsOneWidget);
        });

    testWidgets('El botón Ver mi perfil existe en la pantalla de inicio',
            (WidgetTester tester) async {
          // Cargar el widget principal MyApp
          await tester.pumpWidget(const MyApp());

          // Buscar el botón por su texto
          expect(find.text('Ver mi perfil'), findsOneWidget);
        });
  });
}
