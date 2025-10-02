package com.example.practicaguiada

import android.app.AlertDialog
import android.content.Context
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.EditText
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView

class UsuarioAdapter(
    private val items: MutableList<Usuario>
) : RecyclerView.Adapter<UsuarioAdapter.UsuarioViewHolder>() {

    inner class UsuarioViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView) {
        private val txtNombre: TextView = itemView.findViewById(R.id.txtNombre)
        private val txtEdad: TextView = itemView.findViewById(R.id.txtEdad)
        private val txtCorreo: TextView = itemView.findViewById(R.id.txtCorreo)

        fun bind(usuario: Usuario) {
            txtNombre.text = usuario.nombre
            txtEdad.text = "Edad: ${usuario.edad}"
            txtCorreo.text = usuario.correo

            itemView.setOnLongClickListener {
                val pos = bindingAdapterPosition
                if (pos != RecyclerView.NO_POSITION) {
                    AlertDialog.Builder(itemView.context)
                        .setTitle("Acción")
                        .setItems(arrayOf("Editar", "Eliminar")) { _, which ->
                            when (which) {
                                0 -> showEditDialog(itemView.context, items[pos])
                                1 -> {
                                    items.removeAt(pos)
                                    notifyItemRemoved(pos)
                                }
                            }
                        }
                        .show()
                }
                true
            }
        }

        private fun showEditDialog(context: Context, usuario: Usuario) {
            val dialogView = LayoutInflater.from(context).inflate(R.layout.dialog_edit_usuario, null)
            val editNombre = dialogView.findViewById<EditText>(R.id.editNombre)
            val editEdad = dialogView.findViewById<EditText>(R.id.editEdad)
            val editCorreo = dialogView.findViewById<EditText>(R.id.editCorreo)

            // Valores actuales
            editNombre.setText(usuario.nombre)
            editEdad.setText(usuario.edad.toString())
            editCorreo.setText(usuario.correo)

            AlertDialog.Builder(context)
                .setTitle("Editar usuario")
                .setView(dialogView)
                .setPositiveButton("Guardar") { _, _ ->
                    val pos = bindingAdapterPosition
                    if (pos != RecyclerView.NO_POSITION) {
                        usuario.nombre = editNombre.text.toString()
                        usuario.edad = editEdad.text.toString().toIntOrNull() ?: usuario.edad
                        usuario.correo = editCorreo.text.toString()
                        notifyItemChanged(pos)
                    }
                }
                .setNegativeButton("Cancelar", null)
                .show()
        }
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): UsuarioViewHolder {
        val view = LayoutInflater.from(parent.context).inflate(R.layout.item_usuario, parent, false)
        return UsuarioViewHolder(view)
    }

    override fun onBindViewHolder(holder: UsuarioViewHolder, position: Int) {
        holder.bind(items[position])
    }

    override fun getItemCount(): Int = items.size

    fun addItem(usuario: Usuario) {
        items.add(usuario)
        notifyItemInserted(items.lastIndex)
    }
}