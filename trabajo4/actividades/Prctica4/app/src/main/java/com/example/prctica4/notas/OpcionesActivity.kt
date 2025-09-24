package com.example.prctica4.notas

import android.app.Activity
import android.os.Bundle
import android.widget.Button
import android.widget.TextView
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import com.example.prctica4.R

class OpcionesActivity : AppCompatActivity() {

    private lateinit var tvNota: TextView
    private lateinit var btnCompartirCorreo: Button
    private lateinit var btnEditarDeNuevo: Button
    private var nota: String = ""

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_opciones)

        tvNota = findViewById(R.id.tvNota)
        btnCompartirCorreo = findViewById(R.id.btnCompartirCorreo)
        btnEditarDeNuevo = findViewById(R.id.btnEditarDeNuevo)

        nota = intent.getStringExtra("nota") ?: ""
        tvNota.text = nota

        btnCompartirCorreo.setOnClickListener {
            Toast.makeText(this, "Compartido por correo", Toast.LENGTH_SHORT).show()
            setResult(Activity.RESULT_OK)
            finish()
        }

        btnEditarDeNuevo.setOnClickListener {
            intent.putExtra("nota", nota)
            setResult(Activity.RESULT_CANCELED, intent)
            finish()
        }
    }
}
