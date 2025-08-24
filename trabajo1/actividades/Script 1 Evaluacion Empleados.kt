/*
Descripción: Calcula nivel de rendimiento y dinero recibido según la puntuación y salario.
Autor: Hugo Alonso Diaz Chavez
Fecha creación: 24/08/2025
Última modificación: 24/08/2025
*/

class Empleado(private val salarioMensual: Double, private val puntos: Int) {

    fun obtenerNivel(): String {
        return when (puntos) {
            in 0..3 -> "Inaceptable"
            in 4..6 -> "Aceptable"
            in 7..10 -> "Meritorio"
            else -> "No válido"
        }
    }

    fun calcularDinero(): Double {
        return salarioMensual * (puntos / 10.0)
    }
}

fun main() {
    print("Ingrese su salario mensual: ")
    val salarioMensual = readln().toDouble()

    print("Ingrese su puntuación (0-10): ")
    val puntos = readln().toInt()

    val empleado = Empleado(salarioMensual, puntos)

    println("Nivel de Rendimiento: ${empleado.obtenerNivel()}")
    println("Dinero recibido: ${empleado.calcularDinero()}")
}
