package com.example.nuevaactiviticlass1

import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import com.example.nuevaactiviticlass1.databinding.ActivitySegundaBinding

class SegundaActivity : AppCompatActivity() {

    private lateinit var binding: ActivitySegundaBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivitySegundaBinding.inflate(layoutInflater)
        setContentView(binding.root)

        // Extrae el texto enviado por el Intent desde MainActivity usando la constante estática
        val textoRecibido = intent.getStringExtra(EXTRA_MENSAJE)

        // Muestra el texto en el componente TextView
        binding.tvRespuesta.text = textoRecibido ?: getString(R.string.no_mensaje_recibido)
    }

    companion object {
        const val EXTRA_MENSAJE = "com.example.nuevaactiviticlass1.EXTRA_MENSAJE"
    }
}
