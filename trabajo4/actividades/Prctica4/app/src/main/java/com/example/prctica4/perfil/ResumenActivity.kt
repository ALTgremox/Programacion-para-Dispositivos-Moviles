package com.example.prctica4.perfil

import android.app.Activity
import android.os.Bundle
import android.widget.Button
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity
import com.example.prctica4.R
import com.example.prctica4.model.Usuario

class ResumenActivity : AppCompatActivity() {

    private lateinit var tvNombre: TextView
    private lateinit var tvEdad: TextView
    private lateinit var tvCiudad: TextView
    private lateinit var tvCorreo: TextView
    private lateinit var btnConfirmar: Button
    private lateinit var btnVolverEditar: Button

    private var usuario: Usuario? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_resumen)

        tvNombre = findViewById(R.id.tvNombre)
        tvEdad = findViewById(R.id.tvEdad)
        tvCiudad = findViewById(R.id.tvCiudad)
        tvCorreo = findViewById(R.id.tvCorreo)
        btnConfirmar = findViewById(R.id.btnConfirmar)
        btnVolverEditar = findViewById(R.id.btnVolverEditar)

        usuario = intent.getSerializableExtra("usuario") as? Usuario
        usuario?.let { u ->
            tvNombre.text = "Nombre: ${u.nombre}"
            tvEdad.text = "Edad: ${u.edad}"
            tvCiudad.text = "Ciudad: ${u.ciudad}"
            tvCorreo.text = "Correo: ${u.correo}"
        }

        btnConfirmar.setOnClickListener {
            setResult(Activity.RESULT_OK)
            finish()
        }

        btnVolverEditar.setOnClickListener {
            intent.putExtra("usuario", usuario)
            setResult(Activity.RESULT_CANCELED, intent)
            finish()
        }
    }
}
