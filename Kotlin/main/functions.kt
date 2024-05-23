import java.lang.System.`in`
import java.util.*

//ЛР_5, Задание 2, Вариант 4
class Main{
    //Найти произведение цифр числа.
    fun mult(x: Int): Int = if (x < 10) x else (x % 10) * mult(x / 10)

    //Найти максимальную цифры числа, не делящуюся на 3
    fun max_not_3(x: Int): Int = if (x == 0) 0 else if (x % 3!= 0 && x % 10!= 0) x % 10 else max_not_3(x / 10)

    //Найти количество делителей числа
    fun count_Div(x: Int): Int = if (x == 1) 1 else (count_Div(x - 1) + if (x % x == 0) 1 else 0)

}