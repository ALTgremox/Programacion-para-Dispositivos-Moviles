package com.example.practicas5.ui

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ArrayAdapter
import androidx.core.os.bundleOf
import androidx.fragment.app.Fragment
import com.example.practicas5.MainActivity
import com.example.practicas5.databinding.FragmentSeleccionComidaBinding

class SeleccionComidaFragment : Fragment() {
    private var _binding: FragmentSeleccionComidaBinding? = null
    private val binding get() = _binding!!

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View {
        _binding = FragmentSeleccionComidaBinding.inflate(inflater, container, false)
        return binding.root
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        val opciones = listOf("Pizza", "Hamburguesa", "Ensalada")
        binding.spnComida.adapter = ArrayAdapter(requireContext(), android.R.layout.simple_spinner_dropdown_item, opciones)

        parentFragmentManager.setFragmentResultListener("REQ_EDITAR_PEDIDO", this) { _, result ->
            val comida = result.getString("comida")
            val idx = opciones.indexOf(comida)
            if (idx >= 0) binding.spnComida.setSelection(idx)
        }

        binding.btnSiguiente.setOnClickListener {
            val comida = binding.spnComida.selectedItem?.toString().orEmpty()
            val args = bundleOf("comida" to comida)
            (requireActivity() as MainActivity).replaceFragment(
                SeleccionExtrasFragment(),
                backStackName = "SeleccionExtras",
                args = args
            )
        }
    }

    override fun onDestroyView() {
        super.onDestroyView()
        _binding = null
    }
}
