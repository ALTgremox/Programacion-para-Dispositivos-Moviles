/*
Descripcion: Actividad que muestra una imagen y al hacer clic despliega un Toast con un mensaje.
Autor: Hugo Alonso Diaz Chavez
Fecha creacion: 08/09/2025
Fecha ultima modificacion: 08/09/2025
*/

package com.example.interaccionimagenes

import android.os.Bundle
import android.widget.ImageView
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main) // 🔹 Asegúrate que el archivo XML se llame activity_main.xml

        // 🔹 El id en XML debe coincidir con este
        val mainImage: ImageView = findViewById(R.id.mainImage)

        mainImage.setOnClickListener {
            Toast.makeText(this, "¡Has hecho clic en la imagen!", Toast.LENGTH_SHORT).show()
        }
    }
}
