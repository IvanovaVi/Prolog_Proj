data class Tuple3<A, B, C>(val first: A, val second: B, val third: C)

fun countSquares(list: List<Int>): Int {
    // Создаем множество квадратов элементов из исходного списка
    val squares = list.map { it * it }.toSet()

    // Фильтруем исходный список, оставляя только те элементы, которые содержатся в множестве квадратов
    return list.count { it in squares }
}

fun createTuples(listA: List<Int>, listB: List<Int>, listC: List<Int>): List<Tuple3<Int, Int, Int>> {
    // Сортируем первый список по убыванию
    val sortedA = listA.sortedDescending()

    // Сортируем второй список по возрастанию суммы цифр, при равенстве суммы по убыванию абсолютного значения
    val sortedB = listB.sortedWith(compareBy({ sumDigits(it) }, { -it }))

    // Сортируем третий список по убыванию количества делителей, при равенстве количества по убыванию абсолютного значения
    val sortedC = listC.sortedWith(compareByDescending<Int> { countDivisors(it) }.thenBy { -it })

    // Объединяем три отсортированных списка в список кортежей
    return (0 until minOf(listA.size, listB.size, listC.size)).map { i ->
        Tuple3(sortedA[i], sortedB[i], sortedC[i])
    }
}

fun sumDigits(number: Int): Int {
    return number.toString().map { it.toString().toInt() }.sum()
}

fun countDivisors(number: Int): Int {
    return (1..number).count { number % it == 0 }
}


fun main() {
    val list = listOf(1, 2, 3, 4, 9, 16, 25)
    println(countSquares(list)) // Output: 4

    val listA = listOf(1, 2, 3, 4, 5)
    val listB = listOf(10, 20, 30, 40, 50)
    val listC = listOf(6, 7, 8, 9, 10)

    val tuples = createTuples(listA, listB, listC)

    tuples.forEach { println("(${it.first}, ${it.second}, ${it.third})") }

}