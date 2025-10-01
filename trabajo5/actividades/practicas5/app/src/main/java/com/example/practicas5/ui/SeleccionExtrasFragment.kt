package com.example.practicas5.ui

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.core.os.bundleOf
import androidx.fragment.app.Fragment
import com.example.practicas5.MainActivity
import com.example.practicas5.databinding.FragmentSeleccionExtrasBinding

class SeleccionExtrasFragment : Fragment() {
    private var _binding: FragmentSeleccionExtrasBinding? = null
    private val binding get() = _binding!!

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View {
        _binding = FragmentSeleccionExtrasBinding.inflate(inflater, container, false)
        return binding.root
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        val comida = arguments?.getString("comida").orEmpty()

        binding.btnSiguiente.setOnClickListener {
            val extras = buildList {
                if (binding.chkBebida.isChecked) add("Bebida")
                if (binding.chkPapas.isChecked) add("Papas")
                if (binding.chkPostre.isChecked) add("Postre")
            }.toTypedArray()

            val args = bundleOf("comida" to comida, "extras" to extras)
            (requireActivity() as MainActivity).replaceFragment(
                ResumenPedidoFragment(),
                backStackName = "ResumenPedido",
                args = args
            )
        }
    }

    override fun onDestroyView() {
        super.onDestroyView()
        _binding = null
    }
}
