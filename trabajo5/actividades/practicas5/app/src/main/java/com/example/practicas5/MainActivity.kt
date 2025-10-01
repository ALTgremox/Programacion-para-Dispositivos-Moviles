package com.example.practicas5

import android.os.Bundle
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import androidx.fragment.app.Fragment
import com.example.practicas5.databinding.ActivityMainBinding
import com.example.practicas5.ui.InicioFragment

class MainActivity : AppCompatActivity() {
    private lateinit var binding: ActivityMainBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)
        if (savedInstanceState == null) {
            replaceFragment(InicioFragment(), addToBackStack = false, backStackName = "Inicio")
        }
    }

    fun replaceFragment(
        fragment: Fragment,
        addToBackStack: Boolean = true,
        backStackName: String? = null,
        args: Bundle? = null
    ) {
        supportFragmentManager.beginTransaction().apply {
            replace(R.id.fragment_container, fragment)
            if (addToBackStack) addToBackStack(backStackName)
            commit()
        }

    }

    fun resetToInicio() {
        supportFragmentManager.popBackStack(null, androidx.fragment.app.FragmentManager.POP_BACK_STACK_INCLUSIVE)
        replaceFragment(InicioFragment(), addToBackStack = false, backStackName = "Inicio")
    }

    fun popTo(name: String) {
        supportFragmentManager.popBackStack(name, 0)
    }
}
