package com.example.prctica4.notas

import android.content.Intent
import android.os.Bundle
import android.widget.Button
import android.widget.EditText
import android.widget.Toast
import androidx.activity.result.contract.ActivityResultContracts
import androidx.appcompat.app.AppCompatActivity
import com.example.prctica4.R

class EditorActivity : AppCompatActivity() {

    private lateinit var etNota: EditText
    private lateinit var btnCompartir: Button
    private val K_NOTA = "k_nota"

    private val opcionesLauncher = registerForActivityResult(
        ActivityResultContracts.StartActivityForResult()
    ) { result ->
        if (result.resultCode == RESULT_CANCELED) {
            val nota = result.data?.getStringExtra("nota")
            if (nota != null) etNota.setText(nota)
        } else if (result.resultCode == RESULT_OK) {
            Toast.makeText(this, "Acción completada", Toast.LENGTH_SHORT).show()
        }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_editor)

        etNota = findViewById(R.id.etNota)
        btnCompartir = findViewById(R.id.btnCompartir)

        if (savedInstanceState != null) {
            etNota.setText(savedInstanceState.getString(K_NOTA, ""))
        }

        btnCompartir.setOnClickListener {
            val texto = etNota.text.toString()
            val intent = Intent(this, OpcionesActivity::class.java).apply {
                putExtra("nota", texto)
            }
            opcionesLauncher.launch(intent)
        }
    }

    override fun onSaveInstanceState(outState: Bundle) {
        super.onSaveInstanceState(outState)
        outState.putString(K_NOTA, etNota.text?.toString() ?: "")
    }
}
