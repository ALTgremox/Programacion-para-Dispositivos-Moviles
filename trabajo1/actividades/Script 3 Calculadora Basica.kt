/*
Descripción: Calculadora con suma, resta, multiplicación y división.
Autor: Hugo Alonso Diaz Chavez
Fecha creación: 24/08/2025
Última modificación: 24/08/2025
*/

class Calculadora {

    fun suma(a: Double, b: Double) = a + b
    fun resta(a: Double, b: Double) = a - b
    fun multiplicacion(a: Double, b: Double) = a * b
    fun division(a: Double, b: Double) = if (b != 0.0) a / b else Double.NaN
}

fun mostrarMenu() {
    println("==== Menú ====")
    println("1. Suma")
    println("2. Resta")
    println("3. Multiplicación")
    println("4. División")
    println("5. Salir")
}

fun main() {
    val calculadora = Calculadora()
    var opcion: Int

    do {
        mostrarMenu()
        print("Opción: ")
        opcion = readln().toInt()

        if (opcion in 1..4) {
            print("Número 1: ")
            val numero1 = readln().toDouble()
            print("Número 2: ")
            val numero2 = readln().toDouble()

            val resultado = when (opcion) {
                1 -> calculadora.suma(numero1, numero2)
                2 -> calculadora.resta(numero1, numero2)
                3 -> calculadora.multiplicacion(numero1, numero2)
                4 -> calculadora.division(numero1, numero2)
                else -> 0.0
            }
            println("Resultado: $resultado")
            println(" ")
        }

    } while (opcion != 5)

    println("¡Hasta luego!")
}
