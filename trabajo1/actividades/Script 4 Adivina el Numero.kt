/*
Descripción: Juego para adivinar un número entre 1 y 30 con máximo 5 intentos.
Autor: [Tu Nombre]
Fecha creación: 24/08/2025
Última modificación: 24/08/2025
*/

import kotlin.random.Random

class JuegoAdivinaNumero {

    private val numeroSecreto = Random.nextInt(1, 31)

    fun jugar(maxIntentos: Int) {
        println("Adivina un número entre 1 y 30. Tienes $maxIntentos intentos.")

        var intentos = 0
        while (intentos < maxIntentos) {
            print("Intento ${intentos + 1}: ")
            val intento = readln().toInt()
            intentos++

            if (intento == numeroSecreto) {
                println("¡Ganaste! El número era $numeroSecreto")
                return
            } else if (intento < numeroSecreto) {
                println("El número es mayor.\n")
            } else {
                println("El número es menor.\n")
            }
        }

        println("Game Over. El número era $numeroSecreto")
    }
}

fun main() {
    val MAX_INTENTOS = 5
    val juego = JuegoAdivinaNumero()
    juego.jugar(MAX_INTENTOS)
}
