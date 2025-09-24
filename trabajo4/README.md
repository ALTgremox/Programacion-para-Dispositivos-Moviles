# Práctica 4 — Comunicación entre Actividades (Android/Kotlin)

## Objetivo
Dos ejercicios sin Fragments:
1) **Editor de perfil con confirmación** (FormularioActivity ↔ ResumenActivity) usando `Serializable`, `registerForActivityResult`, `setResult` y `onSaveInstanceState`.
2) **Editor de nota rápida** (EditorActivity ↔ OpcionesActivity) con ida y vuelta de datos y preservación en rotación.

## Estructura
- `perfil/` (FormularioActivity, ResumenActivity)
- `notas/` (EditorActivity, OpcionesActivity)
- `model/Usuario.kt`
- Layouts en `res/layout/`
- `MainActivity` como menú

## Cómo ejecutar
1. Clona el repo y ábrelo en Android Studio.
2. Activa `ViewBinding` o adapta a `findViewById`.
3. Ejecuta la app en un emulador o dispositivo.
4. Desde `MainActivity`, elige el ejercicio.

## Requisitos cumplidos
- Envío de datos con `Intent` (Usuario `Serializable`).
- Resultados con `registerForActivityResult` y `setResult`.
- Estado preservado en rotación con `onSaveInstanceState`.
- Validaciones básicas de formulario y UX simple.

## Funcionalidad adicional
- Validación mínima de campos (edad numérica, campos no vacíos).
- Prefill al volver a editar.
- Arquitectura clara y nombres coherentes.

## Enlace al repositorio
> https://github.com/ALTgremox/Programacion-para-Dispositivos-Moviles.git

## ✍️ Autor

Hugo Alonso Diaz Chavez

Curso: Programación para Dispositivos Móviles

Fecha: 24/09/2025
