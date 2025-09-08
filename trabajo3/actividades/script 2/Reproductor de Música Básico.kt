/*
Descripción: Actividad que implementa un reproductor básico de música con botones para reproducir, pausar y detener.
Autor: Hugo Alonso Diaz Chavez
Fecha creación: 08/09/2025
Fecha última modificación: 08/09/2025
*/

package com.example.reproductormusica

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.media.MediaPlayer
import android.widget.Button

class MainActivity : AppCompatActivity() {

    private lateinit var mediaPlayer: MediaPlayer

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.script2)

        // Inicializar MediaPlayer con un archivo en res/raw
        mediaPlayer = MediaPlayer.create(this, R.raw.mimusica)

        val btnPlay: Button = findViewById(R.id.btnPlay)
        val btnPause: Button = findViewById(R.id.btnPause)
        val btnStop: Button = findViewById(R.id.btnStop)

        // Botón Play
        btnPlay.setOnClickListener {
            if (!mediaPlayer.isPlaying) {
                mediaPlayer.start()
            }
        }

        // Botón Pause
        btnPause.setOnClickListener {
            if (mediaPlayer.isPlaying) {
                mediaPlayer.pause()
            }
        }

        // Botón Stop
        btnStop.setOnClickListener {
            if (mediaPlayer.isPlaying) {
                mediaPlayer.stop()
                mediaPlayer = MediaPlayer.create(this, R.raw.mimusica) // reiniciar
            }
        }
    }

    override fun onDestroy() {
        super.onDestroy()
        mediaPlayer.release()
    }
}
