import java.lang.System.`in`
import java.util.*
import kotlin.math.max

//ЛР_5, Задание 2, Вариант 4________________________________________
class Main{
    //Найти произведение цифр числа.
    fun mult(x: Int): Int = if (x < 10) x else (x % 10) * mult(x / 10)

    //Найти максимальную цифры числа, не делящуюся на 3
    fun max_not_3(x: Int): Int = if (x == 0) 0 else if (x % 3!= 0 && x % 10!= 0) x % 10 else max_not_3(x / 10)

    //Найти количество делителей числа.
    fun count_Div(x: Int): Int = if (x == 1) 1 else (count_Div(x - 1) + if (x % x == 0) 1 else 0)


    //Задание 3____________________________________________________
    //Построить 6 функции, решающих задачи предыдущего задания с помощью рекурсии вверх
    //и хвостовой рекурсии.

    //Найти произведение цифр числа. Рекурсия вниз
    fun mult_dw(n: Int): Int {
        return if (n == 0) 1 else n * mult_dw(n / 10)
    }

    //Найти произведение цифр числа. Рекурсия вверх
    fun mult_up(n: Int): Int {
        return if (n == 0) 1 else mult_up(n * 10) + 1
    }

    //Найти максимальную цифры числа, не делящуюся на 3. Рекурсия вверх
    fun max_not_div_3_up(n: Int): Int {
        var max = -1 // Инициализируем минимально возможное значение
        n.toString().reversed().forEach { digit ->
            if (digit.toInt() % 3!= 0 && digit.toInt() > max) {
                max = digit.toInt()
            }
        }
        return max
    }

    //Найти максимальную цифры числа, не делящуюся на 3. Рекурсия вниз
    fun max_not_div_3_dw(n: Int): Int {
        tailrec fun findMax(start: Int = 9): Int {
            return when {
                start < 0 -> -1 // Базовый случай: если все цифры были проверены и ни одна не удовлетворяет условию
                else -> {
                    val current = start % 10 // Получаем текущую цифру
                    if (current % 3 == 0) findMax(start / 10) // Если текущая цифра делится на 3, продолжаем поиск с предыдущего шага
                    else current // Если текущая цифра не делится на 3, возвращаем ее как максимальную
                }
            }
        }
        return findMax()
    }

    //Найти количество делителей числа. Рекурсия вниз
    tailrec fun count_div_dw(n: Int, divisor: Int = n): Int {
        return when {
            divisor <= 1 -> 0 // Базовый случай: если делитель меньше или равен 1, возвращаем 0
            else -> {
                if (n % divisor == 0) 1 + count_div_dw(n, divisor - 1) // Если текущий делитель делит исходное число, добавляем 1 к результату и продолжаем поиск с следующим делителем
                else count_div_dw(n, divisor - 1) // Если текущий делитель не делит исходное число, просто продолжаем поиск с следующим делителем
            }
        }
    }

    //Найти количество делителей числа. Рекурсия вверх
    tailrec fun count_div_up(n: Int, divisor: Int = 1): Int {
        return when {
            divisor > n -> 0 // Базовый случай: если делитель больше исходного числа, возвращаем 0
            else -> {
                if (n % divisor == 0) 1 + count_div_up(n, divisor + 1) // Если текущий делитель делит исходное число, добавляем 1 к результату и продолжаем поиск с следующим делителем
                else count_div_up(n, divisor + 1) // Если текущий делитель не делит исходное число, просто продолжаем поиск с следующим делителем
            }
        }
    }

    //Задание 4--------------------------------------------------------
    //Функция высших порядков одного аргумента (передается некоторое значение а и лямбда-функция f)
    fun one_Arg(a: Int,f: (Int) -> Int): Int = f(a)

    //Функция высших порядков двух аргументов
    fun two_Args(a:Int,b:Int,f:(Int,Int)->Int) = f(a,b)

    fun main() {
        val scanner = Scanner(`in`)
        val x: Int = scanner.nextInt()
        println(one_Arg(x,::max_not_div_3_up))
    }
}
fun main() = Main().main()
