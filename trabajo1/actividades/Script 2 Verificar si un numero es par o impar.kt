/*
Descripción: Juego de piedra, papel o tijera contra la computadora.
Autor: Hugo Alonso Diaz Chavez
Fecha creación: 24/08/2025
Última modificación: 24/08/2025
*/

import kotlin.random.Random

// Clase que representa el juego Piedra, Papel o Tijera
class JuegoPiedraPapelTijera {

    // Lista con las opciones válidas
    private val opciones = listOf("piedra", "papel", "tijera")

    // Genera aleatoriamente la jugada de la computadora
    fun obtenerEleccionComputadora(): String {
        return opciones[Random.nextInt(opciones.size)]
    }

    // Valida que la elección del usuario sea correcta
    fun validarEntrada(entrada: String): Boolean {
        return entrada.lowercase() in opciones
    }

    // Decide el resultado comparando la jugada del usuario y la de la computadora
    fun decidirGanador(jugador: String, computadora: String): String {
        return if (jugador == computadora) "Empate"
        else if ((jugador == "piedra" && computadora == "tijera") ||
            (jugador == "papel" && computadora == "piedra") ||
            (jugador == "tijera" && computadora == "papel")) "Ganaste"
        else "Perdiste"
    }
}

fun main() {
    val juego = JuegoPiedraPapelTijera()

    println("Bienvenido a Piedra, Papel o Tijera")
    println("Escribe tu elección (piedra, papel o tijera):")

    // Leer la jugada del usuario
    val jugador = readLine()?.lowercase() ?: ""

    if (!juego.validarEntrada(jugador)) {
        println("Opción inválida. Debes escribir piedra, papel o tijera.")
        return
    }

    // Jugada de la computadora
    val computadora = juego.obtenerEleccionComputadora()

    // Mostrar resultados
    println("Tu elección fue: $jugador")
    println("La computadora eligió: $computadora")
    println(juego.decidirGanador(jugador, computadora))
}
