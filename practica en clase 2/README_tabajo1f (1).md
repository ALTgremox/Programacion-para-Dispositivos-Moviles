# 🌟 Proyecto Flutter - tabajo1f

## 🎯 Descripción General
Este proyecto Flutter desarrolla una **aplicación personal con navegación inferior (BottomNavigationBar)** que permite moverse entre las pantallas principales:  
**Inicio**, **Perfil**, **Hobbies** y **Configuración**.  
El objetivo es aplicar los fundamentos del diseño de interfaces con Flutter, la gestión de estado y la comunicación entre pantallas mediante `Navigator.push` y `Navigator.pop(context, data)`.

---

## 🧩 Características Principales
✅ Barra de navegación inferior funcional con 4 pestañas.  
✅ Actualización dinámica del nombre del usuario desde la pantalla **Editar perfil**.  
✅ Diseño modular (cada pantalla en su propio archivo).  
✅ Comunicación entre pantallas usando `Navigator.push` y `Navigator.pop`.  
✅ Widgets personalizados (`HobbyItem`).  
✅ Interfaz limpia y organizada con uso de `Scaffold`, `AppBar`, `BottomNavigationBar`, `ListView`, `Column`, `Padding`, etc.  
✅ Compatible con **Flutter Web (Chrome)**, Android e iOS.  
✅ Cumple los puntos de la rúbrica:
- Estructura clara y organizada.  
- Buenas prácticas y uso de `const`.  
- Comentarios útiles.  
- README actualizado.  
- Navegación funcional, visual y con paso de datos.  

---

## 🗂️ Estructura del Proyecto

```
lib/
├── main.dart
├── pantalla_inicio.dart
├── pantalla_perfil.dart
├── pantalla_hobbies.dart
├── pantalla_editar_perfil.dart
├── pantalla_config.dart
└── widgets/
    └── hobby_item.dart
test/
└── tabajo1f_test.dart
```

---

## 🧱 **Descripción de las Pantallas**

### 🏠 Pantalla de Inicio
- Muestra un texto de bienvenida al usuario.
- Es la primera pestaña de la barra inferior.
- Código: `pantalla_inicio.dart`.

### 👤 Pantalla de Perfil
- Muestra la foto, nombre y descripción del usuario.
- Permite editar el nombre y actualizarlo dinámicamente.
- Contiene un acceso directo a la pantalla de **Hobbies**.
- Código: `pantalla_perfil.dart`.

### 🎵 Pantalla de Hobbies
- Lista de intereses personales con íconos.
- Usa el widget personalizado `HobbyItem`.
- Código: `pantalla_hobbies.dart`.

### ⚙️ Pantalla de Configuración
- Muestra texto informativo con futuras opciones.
- Código: `pantalla_config.dart`.

### ✏️ Pantalla Editar Perfil
- Permite ingresar un nuevo nombre de usuario.
- Retorna el valor capturado con `Navigator.pop(context, data)`.
- Código: `pantalla_editar_perfil.dart`.

---

## ⚙️ **Instalación y Ejecución**

### 📋 Requisitos Previos
- Tener instalado **Flutter SDK**  
  (ruta recomendada: `C:\tools\flutter`)
- Tener Android Studio o VS Code con el plugin Flutter.
- Conectarse a un emulador Android, Chrome o dispositivo físico.

### ▶️ Ejecutar el proyecto
```bash
flutter run
```

---

## 🧪 **Pruebas Automatizadas**
El archivo `test/tabajo1f_test.dart` incluye pruebas básicas de verificación:

- Comprobación del texto “Bienvenido”.
- Verificación del botón “Ver mi perfil”.

Ejecuta las pruebas con:
```bash
flutter test
```

---

## 📸 **Vista previa visual (resumen)**
| Pantalla | Descripción |
|-----------|--------------|
| 🏠 **Inicio** | Texto de bienvenida |
| 👤 **Perfil** | Datos personales, edición de nombre y hobbies |
| 🎵 **Hobbies** | Lista de intereses con íconos |
| ⚙️ **Configuración** | Información general |

---

## 💬 **Aprendizaje logrado**
- Implementación de `BottomNavigationBar` y control de estado con `setState`.  
- Comunicación entre pantallas con `Navigator.push` y `Navigator.pop`.  
- Creación de widgets reutilizables.  
- Diseño limpio, modular y documentado.  
- Aplicación de buenas prácticas Flutter.  

---

## 👨‍💻 **Autor**
**Hugo Díaz Chávez**  
Estudiante de Ingeniería de Software  
Universidad La Salle – 2025-II  
Arequipa, Perú  
