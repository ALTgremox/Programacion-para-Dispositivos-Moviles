# 📱 Flutter – Login + CRUD con Provider (MVVM)

Este proyecto implementa una aplicación móvil en **Flutter**, organizada con el patrón **MVVM** y usando **Provider** para el manejo global del estado.  
Incluye una pantalla de **Login con validaciones profesionales**, y continúa con un módulo CRUD de usuarios con listas dinámicas.

---

## 🚀 Características principales

- ✔ Pantalla de Login con validaciones (correo, contraseña)
- ✔ Manejo de formularios con `Form` + `GlobalKey<FormState>`
- ✔ Navegación entre pantallas con `Navigator.push`
- ✔ CRUD completo (crear, leer, actualizar, eliminar usuarios)
- ✔ Manejo de estado con **Provider + ChangeNotifier**
- ✔ Filtro para mostrar solo usuarios activos
- ✔ Validación de correo con expresión regular
- ✔ Diseño modular siguiendo MVVM

---

## 🧱 Arquitectura (MVVM)

```
lib/
│
├── main.dart
│
├── models/
│   └── user.dart
│
├── viewmodels/
│   └── user_view_model.dart
│
└── views/
    ├── login_screen.dart
    ├── user_list_screen.dart
    └── user_form_screen.dart
```

---

## 🧠 Conceptos clave aplicados

### ✔ Formularios en Flutter
Un formulario usa:

```dart
final _formKey = GlobalKey<FormState>();
```

Permite:
- `validate()` → revisa todos los campos  
- `save()` → ejecuta todos los `onSaved`

### ✔ validator
```dart
validator: (value) {
  if (value == null || value.isEmpty) return 'Campo obligatorio';
  return null;
}
```

### ✔ onSaved
Se ejecuta al final cuando se almacena el formulario.

### ✔ TextEditingController
Se usa cuando necesitas leer o modificar el texto constantemente.

---

## 🛠 Instalación y ejecución

```
flutter pub get
flutter run
```

---

## 🔐 Pantalla de Login

Incluye validaciones:
- Correo obligatorio
- Debe contener "@"
- Contraseña mínima de 6 caracteres

Navegación al CRUD:

```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (_) => UserListScreen(email: _email),
  ),
);
```

---

## 👤 CRUD de Usuarios

Campos:
- Nombre  
- Edad (> 0)  
- Correo válido  
- Género  
- Activo  

Incluye filtro “Solo activos”.

---

## 🧩 Actividades Extra

### ✔ Validación avanzada de contraseña
- Una mayúscula  
- Un número  

### ✔ Mejoras visuales
- Botón "Crear cuenta"  
- Texto "¿Olvidaste tu contraseña?"  

### ✔ Mostrar email del login
En `AppBar`:
```
Bienvenido: email
```

---

## 👨‍💻 Autor
Hugo Alonso Diaz Chavez

