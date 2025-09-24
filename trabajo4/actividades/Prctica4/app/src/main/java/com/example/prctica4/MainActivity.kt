/**
 * Descripción: Menú simple para navegar a los dos ejercicios de la práctica 4.
 * Autor: Hugo Díaz
 * Fecha creación: 2025-09-24
 */
package com.example.prctica4

import android.content.Intent
import android.os.Bundle
import android.widget.Button
import androidx.appcompat.app.AppCompatActivity
import com.example.prctica4.notas.EditorActivity
import com.example.prctica4.perfil.FormularioActivity

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val btnPerfil: Button = findViewById(R.id.btnPerfil)
        val btnNotas: Button = findViewById(R.id.btnNotas)

        btnPerfil.setOnClickListener {
            startActivity(Intent(this, FormularioActivity::class.java))
        }

        btnNotas.setOnClickListener {
            startActivity(Intent(this, EditorActivity::class.java))
        }
    }
}
