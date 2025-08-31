/*
Descripción: Sistema de gestión de biblioteca con clases Material, Libro, Revista, Usuario e interfaz IBiblioteca.
Autor: Hugo Alonso Diaz Chavez
Fecha creación: 31-08-2025
Fecha última modificación: 31-08-2025
*/

// Clase abstracta base para todo tipo de material
abstract class Material(
    val titulo: String,
    val autor: String,
    val anioPublicacion: Int
) {
    abstract fun mostrarDetalles() // Cada material define cómo mostrar sus datos
}

// Subclase Libro, con atributos propios
class Libro(
    titulo: String,
    autor: String,
    anioPublicacion: Int,
    val genero: String,
    val numPaginas: Int
) : Material(titulo, autor, anioPublicacion) {
    override fun mostrarDetalles() {
        println("📖 Libro: $titulo, Autor: $autor, Año: $anioPublicacion, Género: $genero, Páginas: $numPaginas")
    }
}

// Subclase Revista, con otros atributos propios
class Revista(
    titulo: String,
    autor: String,
    anioPublicacion: Int,
    val issn: String,
    val volumen: Int,
    val numero: Int,
    val editorial: String
) : Material(titulo, autor, anioPublicacion) {
    override fun mostrarDetalles() {
        println("📚 Revista: $titulo, Autor: $autor, Año: $anioPublicacion, ISSN: $issn, Volumen: $volumen, Número: $numero, Editorial: $editorial")
    }
}

// Data class Usuario: contiene solo datos
data class Usuario(val nombre: String, val apellido: String, val edad: Int)

// Interfaz que define las operaciones que una biblioteca debe implementar
interface IBiblioteca {
    fun registrarMaterial(material: Material)
    fun registrarUsuario(usuario: Usuario)
    fun prestar(usuario: Usuario, material: Material)
    fun devolver(usuario: Usuario, material: Material)
    fun mostrarDisponibles()
    fun mostrarPrestados(usuario: Usuario)
}

// Clase Biblioteca que implementa la interfaz
class Biblioteca : IBiblioteca {
    private val materialesDisponibles = mutableListOf<Material>()   // Lista de materiales disponibles
    private val prestamos = mutableMapOf<Usuario, MutableList<Material>>() // Map usuario -> lista de préstamos

    override fun registrarMaterial(material: Material) {
        materialesDisponibles.add(material)
    }

    override fun registrarUsuario(usuario: Usuario) {
        prestamos.putIfAbsent(usuario, mutableListOf())
    }

    override fun prestar(usuario: Usuario, material: Material) {
        if (materialesDisponibles.remove(material)) {
            prestamos[usuario]?.add(material)
            println("✅ Prestado: ${material.titulo} a ${usuario.nombre}")
        } else {
            println("❌ Material no disponible")
        }
    }

    override fun devolver(usuario: Usuario, material: Material) {
        if (prestamos[usuario]?.remove(material) == true) {
            materialesDisponibles.add(material)
            println("🔄 Devuelto: ${material.titulo} por ${usuario.nombre}")
        } else {
            println("❌ El usuario no tenía este material en préstamo")
        }
    }

    override fun mostrarDisponibles() {
        println("📚 Materiales disponibles:")
        materialesDisponibles.forEach { it.mostrarDetalles() }
    }

    override fun mostrarPrestados(usuario: Usuario) {
        println("👤 Materiales prestados a ${usuario.nombre}:")
        prestamos[usuario]?.forEach { it.mostrarDetalles() }
    }
}

fun main() {
    val biblioteca = Biblioteca()

    // Se registra un material por teclado
    println("=== Registro de Material ===")
    print("Ingrese 1 para Libro o 2 para Revista: ")
    val opcion = readLine()!!.toInt()

    if (opcion == 1) {
        print("Título: "); val titulo = readLine()!!
        print("Autor: "); val autor = readLine()!!
        print("Año publicación: "); val anio = readLine()!!.toInt()
        print("Género: "); val genero = readLine()!!
        print("Número de páginas: "); val paginas = readLine()!!.toInt()
        biblioteca.registrarMaterial(Libro(titulo, autor, anio, genero, paginas))
    } else {
        print("Título: "); val titulo = readLine()!!
        print("Autor: "); val autor = readLine()!!
        print("Año publicación: "); val anio = readLine()!!.toInt()
        print("ISSN: "); val issn = readLine()!!
        print("Volumen: "); val vol = readLine()!!.toInt()
        print("Número: "); val num = readLine()!!.toInt()
        print("Editorial: "); val editorial = readLine()!!
        biblioteca.registrarMaterial(Revista(titulo, autor, anio, issn, vol, num, editorial))
    }

    // Se registra un usuario por teclado
    println("\n=== Registro de Usuario ===")
    print("Nombre: "); val nombre = readLine()!!
    print("Apellido: "); val apellido = readLine()!!
    print("Edad: "); val edad = readLine()!!.toInt()
    val usuario = Usuario(nombre, apellido, edad)
    biblioteca.registrarUsuario(usuario)

    // Simulación de operaciones
    println("\n=== Operaciones ===")
    biblioteca.mostrarDisponibles()

    println("Prestando el primer material disponible...")
    val material = biblioteca.run { materialesDisponibles.first() } // toma el primer material
    biblioteca.prestar(usuario, material)

    biblioteca.mostrarPrestados(usuario)

    biblioteca.devolver(usuario, material)
    biblioteca.mostrarDisponibles()
}
