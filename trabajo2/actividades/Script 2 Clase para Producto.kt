/*
Descripción: Clase Producto con precio, descuento, métodos set/get y cálculo de precio final.
Autor: Hugo Alonso Diaz Chavez
Fecha creación: 31-08-2025
Fecha última modificación: 31-08-2025
*/

class Producto {
    private var precio: Double = 0.0
    private var descuento: Double = 0.0 // porcentaje

    fun setPrecio(valor: Double) {
        if (valor >= 0) precio = valor else println("Precio no válido")
    }

    fun setDescuento(valor: Double) {
        if (valor in 0.0..100.0) descuento = valor else println("Descuento inválido")
    }

    fun getPrecio(): Double = precio
    fun getDescuento(): Double = descuento

    fun calcularPrecioFinal(): Double {
        return precio * (1 - descuento / 100)
    }
}

fun main() {
    val prod = Producto()
    prod.setPrecio(200.0)
    prod.setDescuento(15.0)
    println("Precio final: ${prod.calcularPrecioFinal()}")
}
