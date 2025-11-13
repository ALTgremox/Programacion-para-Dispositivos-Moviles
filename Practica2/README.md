# 📱 Gestión de Usuarios – Flutter + Provider (MVVM)

Aplicación móvil desarrollada en **Flutter** utilizando el patrón **MVVM** y el paquete **Provider** para manejar el estado de forma eficiente.  
Permite agregar, editar, eliminar y filtrar usuarios, además de validar formularios con campos dinámicos.

---

## 🚀 Características principales

- ✔ CRUD completo de usuarios (Crear, Leer, Actualizar, Eliminar)
- ✔ Manejo de estado global con **Provider** + **ChangeNotifier**
- ✔ Patrón de arquitectura **MVVM**
- ✔ Validación de formularios con reglas personalizadas
- ✔ Campo de **edad** (numérico)
- ✔ Campo de **correo electrónico** con validación RegExp
- ✔ Filtro para mostrar **solo usuarios activos**
- ✔ Listas dinámicas con `ListView.builder`
- ✔ Navegación con `Navigator.push()`

---

## 🧱 Arquitectura (MVVM)

La estructura del proyecto sigue el patrón **Model - View - ViewModel**:

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
    ├── user_list_screen.dart
    └── user_form_screen.dart
```

### ✔ **Model**
Define la estructura del usuario (`User`).

### ✔ **ViewModel**
Maneja la lógica del CRUD y el estado (filtro, lista, actualizaciones).

### ✔ **View**
Pantallas que presentan la UI y escuchan cambios del ViewModel.

---

## 📦 Dependencias

En `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  provider: ^6.1.5+1
```

Ejecutar:

```
flutter pub get
```

---

## 🧩 Funcionalidades detalladas

### 👤 Agregar usuario
- Nombre (validación: no vacío)
- Edad (validación: número > 0)
- Correo electrónico (validación: expresión regular)
- Género (RadioListTile)
- Estado activo (Switch)

### 🖊 Editar usuario
Los datos se cargan automáticamente en el formulario.

### 🗑 Eliminar usuario
Opción directa desde la lista.

### 🔍 Filtro “Solo activos”
Permite mostrar únicamente los usuarios cuyo campo `activo == true`.

---

## 🧠 Conceptos clave enseñados en el proyecto

### ✔ Provider vs setState()
- Provider organiza mejor el código y mantiene la lógica fuera de la UI.
- Permite estado global, reactividad y arquitectura escalable.

### ✔ ChangeNotifier
Habilita el uso de `notifyListeners()` para actualizar la UI automáticamente.

### ✔ notifyListeners()
Sin esto:
- La UI NO se actualiza
- Los cambios se quedan solo en memoria

---

## 👨🏻‍💻 Autor

Hugo Alonso Diaz Chavez