package com.example.nuevaactiviticlass1

import android.content.Intent
import android.os.Bundle
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import com.example.nuevaactiviticlass1.databinding.ActivityMainBinding

class MainActivity : AppCompatActivity() {

    private lateinit var binding: ActivityMainBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)

        binding.btnEnviar.setOnClickListener {
            val textoAEnviar = binding.etInputText.text.toString().trim()

            if (textoAEnviar.isEmpty()) {
                binding.etInputText.error = getString(R.string.error_campo_vacio)
                Toast.makeText(this, R.string.error_campo_vacio, Toast.LENGTH_SHORT).show()
            } else {
                // Se crea el Intent apuntando a la segunda Activity usando la constante estática
                val intent = Intent(this, SegundaActivity::class.java).apply {
                    putExtra(SegundaActivity.EXTRA_MENSAJE, textoAEnviar)
                }
                startActivity(intent)
            }
        }
    }
}
