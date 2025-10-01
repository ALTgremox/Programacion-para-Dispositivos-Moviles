package com.example.practicas5.ui

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Toast
import androidx.fragment.app.Fragment
import com.example.practicas5.MainActivity
import com.example.practicas5.databinding.FragmentResumenPedidoBinding

class ResumenPedidoFragment : Fragment() {
    private var _binding: FragmentResumenPedidoBinding? = null
    private val binding get() = _binding!!

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View {
        _binding = FragmentResumenPedidoBinding.inflate(inflater, container, false)
        return binding.root
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        val comida = arguments?.getString("comida").orEmpty()
        val extras = arguments?.getStringArray("extras")?.toList().orEmpty()

        binding.txtResumen.text = "Comida: $comida\nExtras: ${if (extras.isEmpty()) "(ninguno)" else extras.joinToString(", ")}"

        binding.btnConfirmar.setOnClickListener {
            Toast.makeText(requireContext(), "Pedido confirmado ✔️", Toast.LENGTH_SHORT).show()
            (requireActivity() as MainActivity).resetToInicio()
        }

        binding.btnEditar.setOnClickListener {
            val result = Bundle().apply {
                putString("comida", comida)
                putStringArray("extras", extras.toTypedArray())
            }
            parentFragmentManager.setFragmentResult("REQ_EDITAR_PEDIDO", result)
            (requireActivity() as MainActivity).popTo("SeleccionComida")
        }
    }

    override fun onDestroyView() {
        super.onDestroyView()
        _binding = null
    }
}
