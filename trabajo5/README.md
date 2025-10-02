# 📱 Práctica 5 – Configurador de Pedido con Fragments

### 🎯 Objetivo
Desarrollar una aplicación Android en **Kotlin** que permita al usuario armar un pedido de comida paso a paso utilizando **Fragments** y comunicación entre ellos, sin usar Navigation Component (solo `FragmentManager`).

---

## 🧩 Flujo de la aplicación

1. **InicioFragment**
   - Botón **Nuevo pedido** → abre `SeleccionComidaFragment`.

2. **SeleccionComidaFragment**
   - Selección de comida (Pizza 🍕, Hamburguesa 🍔, Ensalada 🥗).
   - Botón **Siguiente** → pasa la comida seleccionada a `SeleccionExtrasFragment`.

3. **SeleccionExtrasFragment**
   - Selección de extras: Bebida 🥤, Papas 🍟, Postre 🍰.
   - Botón **Siguiente** → pasa la comida + extras a `ResumenPedidoFragment`.

4. **ResumenPedidoFragment**
   - Muestra el pedido completo (comida + extras).
   - Botón **Confirmar pedido** → muestra un `Toast` ✅ y regresa al inicio.
   - Botón **Editar pedido** → envía los datos seleccionados a `SeleccionComidaFragment` usando **setFragmentResult**.

---

## ⚙️ Tecnologías utilizadas
- Kotlin 2.x
- AndroidX Fragments
- **ViewBinding** (sin `findViewById`)
- FragmentManager (`replaceFragment`, `popTo`, `resetToInicio`)
- Comunicación entre fragments con `setFragmentResult` y `setFragmentResultListener`

---

## 📂 Estructura del proyecto

```
app/src/main/java/com/example/practicas5/
│── MainActivity.kt
│
└── ui/
    ├── InicioFragment.kt
    ├── SeleccionComidaFragment.kt
    ├── SeleccionExtrasFragment.kt
    └── ResumenPedidoFragment.kt

app/src/main/res/layout/
│── activity_main.xml
│── fragment_inicio.xml
│── fragment_seleccion_comida.xml
│── fragment_seleccion_extras.xml
│── fragment_resumen_pedido.xml
```

---

## 🚀 Cómo ejecutar

1. Clonar o descargar este repositorio.
2. Abrir en **Android Studio** (Ladybug o superior).
3. Sincronizar Gradle.
4. Ejecutar en un emulador o dispositivo con **API 24+**.

---

## 📝 Criterios de Evaluación (rúbrica)

- ✅ **Estructura clara** del proyecto (paquetes `ui`, `layout`, `values`).  
- ✅ **Buenas prácticas Kotlin**: nombres descriptivos, `ViewBinding`, modularidad.  
- ✅ **Comentarios** en las clases explicando su función.  
- ✅ **Control de versiones**: commits frecuentes con mensajes claros.  
- ✅ **Funcionalidad completa**: flujo de pedido funcionando, confirmación, edición.  
- ⭐ **Extra**: se puede extender con cálculo de precio total o validaciones de entrada.

---

## ✨ Vista previa (conceptual)

```
Inicio → Selección comida → Selección extras → Resumen
```

➡️ Confirmar → vuelve al Inicio  
➡️ Editar → regresa a Selección comida con datos cargados

---

## Enlace al repositorio
> https://github.com/ALTgremox/Programacion-para-Dispositivos-Moviles.git

## ✍️ Autor

Hugo Alonso Diaz Chavez

Curso: Programación para Dispositivos Móviles

Fecha: 01/10/2025
