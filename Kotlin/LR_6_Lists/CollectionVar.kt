

fun countLocalMaxima(array: IntArray): Long {
    // Считаем количество локальных максимумов
    return array.indices.drop(1).dropLast(1).count { array[it] > array[it - 1] && array[it] > array[it + 1] }.toLong()
}

fun getDescendingIndices(array: IntArray): List<Int> {
    // Создаем поток индексов массива, сортируем их по значениям элементов в убывающем порядке
    return array.indices.sortedByDescending { array[it] }
}

fun getElementsBeforeLastMin(array: IntArray): List<Int> {
    // Находим индекс последнего минимального элемента
    val lastMinIndex = array.indices.last { array[it] == array.minOrNull() }

    // Возвращаем элементы, расположенные перед последним минимальным элементом
    return array.take(lastMinIndex)
}

fun isLocalMinimum(array: IntArray, index: Int): Boolean {
    if (index !in array.indices) {
        throw IllegalArgumentException("Index out of bounds")
    }

    // Получаем значения соседних элементов (если они существуют)
    val left = if (index > 0) array[index - 1] else Int.MAX_VALUE
    val right = if (index < array.size - 1) array[index + 1] else Int.MAX_VALUE

    // Проверяем, является ли элемент локальным минимумом
    return array[index] < left && array[index] < right
}

fun isMaxInInterval(array: IntArray, a: Int, b: Int): Boolean {
    if (a !in array.indices || b !in array.indices || a > b) {
        throw IllegalArgumentException("Invalid interval")
    }

    // Находим максимальный элемент в массиве
    val max = array.maxOrNull() ?: Int.MIN_VALUE

    // Проверяем, находится ли максимальный элемент в заданном интервале
    return (a..b).any { array[it] == max }
}



fun main() {
    val array = intArrayOf(4, 2, 7, 1, 3, 6, 5)
    // Выводим количество локальных максимумов
    println(countLocalMaxima(array)) // Output: 2

    val array1 = intArrayOf(4, 2, 7, 1, 3)
    // Выводим индексы элементов массива в порядке убывания значений
    println(getDescendingIndices(array1)) // Output: [2, 0, 4, 1, 3]

    val array2 = intArrayOf(4, 2, 7, 1, 3, 1, 5)
    // Выводим элементы, расположенные перед последним минимальным элементом
    println(getElementsBeforeLastMin(array2)) // Output: [4, 2, 7, 1, 3]

    val array3 = intArrayOf(4, 2, 7, 1, 3)
    val index = 3
    // Проверяем, является ли элемент по указанному индексу локальным минимумом
    println(isLocalMinimum(array3, index)) // Output: true

    val array4 = intArrayOf(4, 2, 7, 1, 3, 6, 5)
    val a = 2
    val b = 5
    // Проверяем, находится ли максимальный элемент массива в заданном интервале
    println(isMaxInInterval(array4, a, b)) // Output: true
}