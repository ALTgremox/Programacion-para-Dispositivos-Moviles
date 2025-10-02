package com.example.practicaguiada

import android.os.Bundle
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.google.android.material.floatingactionbutton.FloatingActionButton

class MainActivity : AppCompatActivity() {

    private lateinit var recycler: RecyclerView
    private lateinit var fab: FloatingActionButton
    private lateinit var adapter: UsuarioAdapter

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContentView(R.layout.activity_main)

        recycler = findViewById(R.id.recyclerUsuarios)
        fab = findViewById(R.id.fabAgregar)

        val usuarios = mutableListOf(
            Usuario("Ana", 22, "ana@example.com"),
            Usuario("Luis", 30, "luis@example.com"),
            Usuario("Marta", 27, "marta@example.com")
        )

        adapter = UsuarioAdapter(usuarios)
        recycler.layoutManager = LinearLayoutManager(this)
        recycler.adapter = adapter
        recycler.setHasFixedSize(true)

        fab.setOnClickListener {
            adapter.addItem(Usuario("Nuevo", 18, "nuevo@example.com"))
            recycler.scrollToPosition(adapter.itemCount - 1)
        }
    }
}