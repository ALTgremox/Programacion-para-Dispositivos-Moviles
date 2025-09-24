package com.example.prctica4.perfil

import android.content.Intent
import android.os.Bundle
import android.widget.Button
import android.widget.EditText
import android.widget.Toast
import androidx.activity.result.contract.ActivityResultContracts
import androidx.appcompat.app.AppCompatActivity
import com.example.prctica4.R
import com.example.prctica4.model.Usuario

class FormularioActivity : AppCompatActivity() {

    private lateinit var etNombre: EditText
    private lateinit var etEdad: EditText
    private lateinit var etCiudad: EditText
    private lateinit var etCorreo: EditText
    private lateinit var btnContinuar: Button

    private val resumenLauncher = registerForActivityResult(
        ActivityResultContracts.StartActivityForResult()
    ) { result ->
        when (result.resultCode) {
            RESULT_OK -> {
                Toast.makeText(this, "Perfil guardado correctamente", Toast.LENGTH_SHORT).show()
            }
            RESULT_CANCELED -> {
                val user = result.data?.getSerializableExtra("usuario") as? Usuario
                if (user != null) prefill(user)
            }
        }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_formulario)

        etNombre = findViewById(R.id.etNombre)
        etEdad = findViewById(R.id.etEdad)
        etCiudad = findViewById(R.id.etCiudad)
        etCorreo = findViewById(R.id.etCorreo)
        btnContinuar = findViewById(R.id.btnContinuar)

        btnContinuar.setOnClickListener {
            val nombre = etNombre.text.toString().trim()
            val edadStr = etEdad.text.toString().trim()
            val ciudad = etCiudad.text.toString().trim()
            val correo = etCorreo.text.toString().trim()

            val edad = edadStr.toIntOrNull()
            if (nombre.isEmpty() || ciudad.isEmpty() || correo.isEmpty() || edad == null) {
                Toast.makeText(this, "Completa todos los campos", Toast.LENGTH_SHORT).show()
                return@setOnClickListener
            }

            val usuario = Usuario(nombre, edad, ciudad, correo)
            val intent = Intent(this, ResumenActivity::class.java).apply {
                putExtra("usuario", usuario)
            }
            resumenLauncher.launch(intent)
        }
    }

    private fun prefill(u: Usuario) {
        etNombre.setText(u.nombre)
        etEdad.setText(u.edad.toString())
        etCiudad.setText(u.ciudad)
        etCorreo.setText(u.correo)
    }
}
