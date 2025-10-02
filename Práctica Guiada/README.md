# Práctica Guiada: RecyclerView con Edición y Long Click

## Introducción teórica
El RecyclerView es un componente avanzado que permite mostrar listas de datos de manera eficiente. Cada elemento se representa mediante un `ViewHolder`, y el `Adapter` enlaza los datos con las vistas.

### Objetivos
1. Detectar un **long click** en un elemento.
2. Mostrar un **menú de opciones** (Editar o Eliminar).
3. Abrir un **diálogo personalizado** para editar los datos de un usuario (nombre, edad, correo).
4. Actualizar el RecyclerView con **notifyItemChanged()**.

## Diálogos en Android
```kotlin
AlertDialog.Builder(this)
    .setTitle("Confirmación")
    .setMessage("¿Seguro que quieres continuar?")
    .setPositiveButton("Sí") { _, _ -> /* Acción si acepta */ }
    .setNegativeButton("No", null)
    .show()
```

## Relación con RecyclerView
- Long click → menú de acciones (Editar / Eliminar).
- Editar → `AlertDialog` con layout `dialog_edit_usuario.xml` (Nombre, Edad y Correo).

## Implementación incluida
- `Usuario.kt` (modelo)
- `UsuarioAdapter.kt` (adapter con long click + edición + eliminación)
- `item_usuario.xml` (layout de fila)
- `dialog_edit_usuario.xml` (layout del diálogo)
- `MainActivity.kt` configurando `RecyclerView` y `FloatingActionButton` para agregar
- Dependencia **RecyclerView** añadida al `libs.versions.toml` y `build.gradle.kts`
- **ViewBinding** habilitado

## Pruebas
✔️ Long click en un usuario → menú Editar/Eliminar.  
✔️ Editar → guardar y ver cambios con `notifyItemChanged()`.  
✔️ Eliminar → `notifyItemRemoved()` actualiza la lista.  
✔️ Agregar → FAB agrega un usuario de ejemplo.

## Preguntas de reflexión (Respuestas)
**¿Diferencia entre `notifyItemRemoved()`, `notifyItemInserted()` y `notifyItemChanged()`?**  
- `notifyItemRemoved(pos)`: se eliminó un ítem en `pos`.  
- `notifyItemInserted(pos)`: se insertó un ítem en `pos`.  
- `notifyItemChanged(pos)`: cambió el contenido del ítem en `pos` sin cambiar el tamaño de la lista.

**¿Por qué validar `bindingAdapterPosition != RecyclerView.NO_POSITION`?**  
Evita operar sobre una posición inválida durante animaciones o actualizaciones, previniendo errores.

**Ventajas de diálogo vs nueva pantalla para editar**  
Contexto inmediato, menos navegación y estado más simple (ideal para ediciones rápidas).

## Enlace al repositorio
> https://github.com/ALTgremox/Programacion-para-Dispositivos-Moviles.git

### Preguntas de reflexión

**1) Diferencia entre `notifyItemRemoved()`, `notifyItemInserted()` y `notifyItemChanged()`**
- `notifyItemRemoved(pos)`: Notifica al `RecyclerView` que un elemento fue **eliminado** en `pos`. Se anima la salida y se actualizan las posiciones siguientes.
- `notifyItemInserted(pos)`: Notifica que se **insertó** un nuevo elemento en `pos`. Se anima la entrada y se ajustan las posiciones siguientes.
- `notifyItemChanged(pos)`: Notifica que el contenido del elemento en `pos` fue **modificado**, sin alterar el tamaño de la lista. Solo se redibuja ese ítem.

---

**2) ¿Por qué validar `bindingAdapterPosition != RecyclerView.NO_POSITION`?**
- Porque durante animaciones o actualizaciones, un `ViewHolder` puede quedar **desacoplado** y su posición no ser válida.
- Esta validación evita errores como `IndexOutOfBoundsException` o modificar/eliminar un ítem que ya no existe.

---

**3) Ventajas de usar un diálogo frente a abrir una nueva pantalla para editar**
- **Contexto inmediato**: el usuario sigue viendo la lista mientras edita.
- **Menos navegación**: no se cambia de Activity/Fragment, ideal para ediciones rápidas.
- **Simplicidad**: no se requiere pasar datos entre pantallas.
- **Agilidad**: interacción más fluida para cambios pequeños.


## ✍️ Autor

Hugo Alonso Diaz Chavez

Curso: Programación para Dispositivos Móviles

Fecha: 24/09/2025
