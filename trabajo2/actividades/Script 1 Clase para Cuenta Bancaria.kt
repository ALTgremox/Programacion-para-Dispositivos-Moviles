/*
Descripción: Clase CuentaBancaria con saldo, límite de retiro, métodos set/get y retiro con validación.
Autor: Hugo Alonso Diaz Chavez
Fecha creación: 31-08-2025
Fecha última modificación: 31-08-2025
*/

class CuentaBancaria(private var limiteRetiro: Double) {
    private var saldo: Double = 0.0

    fun setSaldo(valor: Double) {
        if (valor >= 0) saldo = valor else println("❌ Saldo no puede ser negativo")
    }

    fun getSaldo(): Double = saldo

    fun retirar(monto: Double) {
        if (monto <= saldo && monto <= limiteRetiro) {
            saldo -= monto
            println("Retiro exitoso: $monto, Saldo restante: $saldo")
        } else {
            println("Retiro inválido. Monto supera saldo o límite.")
        }
    }
}

fun main() {
    val cuenta = CuentaBancaria(500.0)
    cuenta.setSaldo(1000.0)
    cuenta.retirar(300.0)
    cuenta.retirar(600.0) // excede límite
}
