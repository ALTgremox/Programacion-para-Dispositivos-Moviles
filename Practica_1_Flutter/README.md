# 🌟 Proyecto Flutter - tabajo1f

## 🎯 Descripción General
Este proyecto Flutter desarrolla una **aplicación personal con tres pantallas conectadas**:  
**Inicio**, **Perfil**, y **Hobbies**.  
El objetivo es aplicar los fundamentos del diseño de interfaces con Flutter y practicar el uso de widgets visuales, navegación entre pantallas y buenas prácticas de desarrollo.

---

## 🧩 Características Principales
✅ Diseño modular (cada pantalla en un archivo independiente).  
✅ Navegación funcional entre pantallas usando `Navigator.pushNamed`.  
✅ Widgets personalizados (`HobbyItem`).  
✅ Interfaz limpia y organizada con uso de `Scaffold`, `AppBar`, `Column`, `ListView`, `Card`, `Padding`, etc.  
✅ Compatible con **Flutter Web (Chrome)**, Android e iOS.  
✅ Cumple los puntos de la rúbrica:
- Estructura clara y organizada.  
- Buenas prácticas y uso de `const`.  
- Comentarios útiles.  
- README incluido.  
- Navegación funcional y visual correcta.  

---

## 🗂️ Estructura del Proyecto

```
lib/
├── main.dart
├── pantalla_inicio.dart
├── pantalla_perfil.dart
├── pantalla_hobbies.dart
└── widgets/
    └── hobby_item.dart
test/
└── tabajo1f_test.dart
```

---

## 🧱 **Descripción de las Pantallas**

### 🟦 Pantalla de Inicio
- Muestra un texto de bienvenida y un botón **“Ver mi perfil”**.  
- Al presionar el botón, navega a la pantalla de perfil.  
- Código principal: `pantalla_inicio.dart`.

### 🟩 Pantalla de Perfil
- Muestra la foto, nombre y descripción personal.  
- Incluye información de contacto (correo, teléfono, ubicación).  
- Tiene un botón para regresar al inicio y un ícono para ir a **Hobbies**.  
- Código principal: `pantalla_perfil.dart`.

### 🟨 Pantalla de Hobbies
- Muestra una lista de intereses o pasatiempos con íconos personalizados.  
- Usa el widget `HobbyItem` para reutilizar código.  
- Tiene un botón flotante para volver a la pantalla de perfil.  
- Código principal: `pantalla_hobbies.dart`.

---

## ⚙️ **Instalación y Ejecución**

### 📋 Requisitos Previos
- Tener instalado **Flutter SDK**  
  (ruta recomendada: `C:\tools\flutter`)
- Tener Android Studio o VS Code con el plugin Flutter.
- Conectarse a un emulador Android, Chrome o dispositivo físico.


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
| 🏠 **Inicio** | Texto de bienvenida y botón de perfil |
| 👤 **Perfil** | Datos personales, contacto y navegación a hobbies |
| 🎵 **Hobbies** | Lista de intereses con íconos y botón “Volver” |

---

## 💬 **Aprendizaje logrado**
- Uso de widgets estructurales (`Column`, `Row`, `Padding`, `Scaffold`).  
- Creación de widgets personalizados.  
- Implementación de rutas y navegación (`Navigator.pushNamed`).  
- Configuración de proyecto y pruebas Flutter.  
- Documentación y control de versiones con README.

---

## 👨‍💻 **Autor**
**Hugo Díaz Chávez**  
Estudiante de Ingeniería de Software  
Universidad La Salle – 2025-II  
Arequipa, Perú  
