/*
Descripción: Clase abstracta Shape con área, perímetro y subclases (Cuadrado, Rectángulo, Círculo).
Autor: Hugo Alonso Diaz Chavez
Fecha creación: 31-08-2025
Fecha última modificación: 31-08-2025
*/

// Clase abstracta base: define la estructura que TODAS las figuras deben seguir
abstract class Shape {
    abstract fun calcularArea(): Double      // Método abstracto (cada figura lo implementa distinto)
    abstract fun calcularPerimetro(): Double // Método abstracto

    // Método común para imprimir resultados
    fun imprimirResultados() {
        println("Área: ${calcularArea()}, Perímetro: ${calcularPerimetro()}")
    }
}

// Subclase para Cuadrado: hereda de Shape
class Cuadrado(private val lado: Double) : Shape() {
    override fun calcularArea() = lado * lado
    override fun calcularPerimetro() = 4 * lado
}

// Subclase para Rectángulo: hereda de Shape
class Rectangulo(private val largo: Double, private val ancho: Double) : Shape() {
    override fun calcularArea() = largo * ancho
    override fun calcularPerimetro() = 2 * (largo + ancho)
}

// Subclase para Círculo: hereda de Shape
class Circulo(private val radio: Double) : Shape() {
    override fun calcularArea() = Math.PI * radio * radio
    override fun calcularPerimetro() = 2 * Math.PI * radio
}

fun main() {
    println("Seleccione la figura: 1) Cuadrado 2) Rectángulo 3) Círculo")
    when (readLine()!!.toInt()) { // Menú para elegir figura
        1 -> {
            print("Ingrese el lado: ")
            val lado = readLine()!!.toDouble()
            val cuadrado = Cuadrado(lado)
            cuadrado.imprimirResultados()
        }
        2 -> {
            print("Ingrese el largo: ")
            val largo = readLine()!!.toDouble()
            print("Ingrese el ancho: ")
            val ancho = readLine()!!.toDouble()
            val rect = Rectangulo(largo, ancho)
            rect.imprimirResultados()
        }
        3 -> {
            print("Ingrese el radio: ")
            val radio = readLine()!!.toDouble()
            val circ = Circulo(radio)
            circ.imprimirResultados()
        }
    }
}
