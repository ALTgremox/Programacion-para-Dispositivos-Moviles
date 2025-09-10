# 📱 Práctica Guiada: Ciclo de Vida de una Activity en Android

## 🎯 Objetivo
Comprender y aplicar el **ciclo de vida de una Activity en Android**, utilizando métodos como `onCreate()`, `onStart()`, `onResume()`, `onPause()`, `onStop()`, `onDestroy()`, `onSaveInstanceState()` y `onRestoreInstanceState()`.  
La práctica permitirá observar cómo Android administra las Activities y cómo conservar información (estado) al rotar la pantalla.

---

## 📘 Introducción Teórica
En Android, una **Activity** representa una pantalla con la que el usuario interactúa.  
El sistema operativo controla su ciclo de vida, dividiéndolo en diferentes etapas:

- **onCreate()** → Se ejecuta al crear la Activity. Se inicializa la interfaz.  
- **onStart()** → La Activity se vuelve visible.  
- **onResume()** → La Activity está activa y lista para el usuario.  
- **onPause()** → La Activity pierde el foco (ejemplo: llega una llamada).  
- **onStop()** → La Activity ya no es visible.  
- **onDestroy()** → La Activity es destruida.  
- **onSaveInstanceState()** → Se guarda el estado antes de la destrucción.  
- **onRestoreInstanceState()** → Se recupera el estado guardado.  

Conocer este ciclo es fundamental para crear **apps robustas y eficientes**.

---

## 📺 Recursos previos
1. [Activity y Ciclo de Vida](https://www.youtube.com/watch?v=YDPHFl5LC34)  
2. [Ciclo de Vida](https://www.youtube.com/watch?v=3r8ianvCaaM)  
3. [onSaveInstanceState, onRestoreInstanceState](https://www.youtube.com/watch?v=QieP0fAvUes)  

---

## 🛠️ Desarrollo de la práctica

### Paso 1: Crear el proyecto
- Nombre: **CicloDeVidaApp**  
- Plantilla: **Empty Views Activity**  
- Lenguaje: **Kotlin**

---

### Paso 2: Diseñar la interfaz (`activity_main.xml`)
```xml
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:orientation="vertical"
    android:padding="16dp"
    android:gravity="center">

    <TextView
        android:id="@+id/textViewContador"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="Contador: 0"
        android:textSize="22sp"/>

    <Button
        android:id="@+id/btnAumentar"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="Aumentar contador"
        android:layout_marginTop="20dp"/>
</LinearLayout>
```
### Paso 3: Programar la lógica (`MainActivity.kt`)
```kt
class MainActivity : AppCompatActivity() {

    private var contador = 0
    private lateinit var textViewContador: TextView

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        textViewContador = findViewById(R.id.textViewContador)
        val btnAumentar = findViewById<Button>(R.id.btnAumentar)

        btnAumentar.setOnClickListener {
            contador++
            textViewContador.text = "Contador: $contador"
        }

        Log.d("CICLO", "onCreate llamado")
        Toast.makeText(this, "onCreate()", Toast.LENGTH_SHORT).show()
    }

    override fun onStart() {
        super.onStart()
        Log.d("CICLO", "onStart llamado")
        Toast.makeText(this, "onStart()", Toast.LENGTH_SHORT).show()
    }

    override fun onResume() {
        super.onResume()
        Log.d("CICLO", "onResume llamado")
        Toast.makeText(this, "onResume()", Toast.LENGTH_SHORT).show()
    }

    override fun onPause() {
        super.onPause()
        Log.d("CICLO", "onPause llamado")
        Toast.makeText(this, "onPause()", Toast.LENGTH_SHORT).show()
    }

    override fun onStop() {
        super.onStop()
        Log.d("CICLO", "onStop llamado")
        Toast.makeText(this, "onStop()", Toast.LENGTH_SHORT).show()
    }

    override fun onDestroy() {
        super.onDestroy()
        Log.d("CICLO", "onDestroy llamado")
        Toast.makeText(this, "onDestroy()", Toast.LENGTH_SHORT).show()
    }

    override fun onSaveInstanceState(outState: Bundle) {
        super.onSaveInstanceState(outState)
        outState.putInt("CONTADOR", contador)
    }

    override fun onRestoreInstanceState(savedInstanceState: Bundle) {
        super.onRestoreInstanceState(savedInstanceState)
        contador = savedInstanceState.getInt("CONTADOR")
        textViewContador.text = "Contador: $contador"
    }
}

```
---
## 🔎 Paso 4: Observar los Logs en Logcat
En Android Studio:  
1. Abre la pestaña **Logcat**.  
2. En la barra de búsqueda, escribe la etiqueta usada en `Log.d()` → **CICLO**.  
3. Realiza estas pruebas y observa los mensajes en consola y los Toast en pantalla:  
   - **Abrir la app** → se ejecutan `onCreate()`, `onStart()`, `onResume()`.  
   - **Girar la pantalla** → la Activity se destruye y vuelve a crearse (se llaman nuevamente `onCreate`, `onStart`, `onResume`).  
   - **Minimizar la app** → se ejecutan `onPause()` y `onStop()`.  
   - **Cerrar la app** → se ejecuta `onDestroy()`.  

---

## ❓ Preguntas de Reflexión
1. **¿Qué sucede si no usamos `onSaveInstanceState`?**  
   El contador se reinicia al rotar la pantalla, porque la Activity se destruye y se crea de nuevo, perdiendo los datos temporales.  

2. **¿Por qué Android destruye y vuelve a crear la Activity al rotar la pantalla?**  
   Porque debe recargar los recursos gráficos y de configuración asociados a la nueva orientación (layouts, imágenes, estilos, etc.).  

3. **¿En qué casos prácticos usarías `onPause` y `onStop`?**  
   - `onPause`: cuando necesitas pausar tareas rápidas al perder el foco, como detener un video, música o guardar texto temporal.  
   - `onStop`: cuando necesitas liberar recursos más pesados, como detener sensores, GPS, conexiones de red o procesos de fondo cuando la app ya no es visible.  


---

## ✍️ Autor

Hugo Alonso Diaz Chavez

Curso: Programación para Dispositivos Móviles

Fecha: 10/09/2025
