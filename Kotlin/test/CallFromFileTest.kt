import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Test

internal class CallFromFileTest {

    private lateinit var main: CallFromFileFunctions

    @Test
    fun test_Mult() {
        assertEquals(120, main.mult(12))
        assertEquals(3628800, main.mult(3628800))
        assertEquals(1, main.mult(0)) // Тест для случая, когда число равно нулю
    }

    @Test
    fun test_Max_Not_3() {
        assertEquals(7, main.maxnot3(123))
        assertEquals(8, main.maxnot3(81283))
        assertEquals(0, main.maxnot3(300)) // Тест для случая, когда максимальная цифра делится на 3
    }

    @Test
    fun test_Count_Div() {
        assertEquals(4, main.count_Div(36))
        assertEquals(2, main.count_Div(25))
        assertEquals(1, main.count_Div(13)) // Тест для случая, когда число является простым числом
    }

    @Test
    fun test_Mult_dw() {
        assertEquals(120, main.mult_dw(12))
        assertEquals(3628800, main.mult_dw(3628800))
        assertEquals(1, main.mult_dw(0)) // Тест для случая, когда число равно нулю
    }

    @Test
    fun test_Max_Not_3_dw() {
        assertEquals(7, main.max_not_div_3_dw(123))
        assertEquals(8, main.max_not_div_3_dw(81283))
        assertEquals(0, main.max_not_div_3_dw(300)) // Тест для случая, когда максимальная цифра делится на 3
    }

    @Test
    fun test_Count_Div_dw() {
        assertEquals(4, main.count_div_dw(36))
        assertEquals(2, main.count_div_dw(25))
        assertEquals(1, main.count_div_dw(13)) // Тест для случая, когда число является простым числом
    }

    @Test
    fun test_Mult_up() {
        assertEquals(120, main.mult_up(12))
        assertEquals(3628800, main.mult_up(3628800))
        assertEquals(1, main.mult_up(0)) // Тест для случая, когда число равно нулю
    }

    @Test
    fun test_Max_Not_3_up() {
        assertEquals(7, main.max_not_div_3_up(123))
        assertEquals(8, main.max_not_div_3_up(81283))
        assertEquals(0, main.max_not_div_3_up(300)) // Тест для случая, когда максимальная цифра делится на 3
    }

    @Test
    fun test_Count_Div_up() {
        assertEquals(4, main.count_div_up(36))
        assertEquals(2, main.count_div_up(25))
        assertEquals(1, main.count_div_up(13)) // Тест для случая, когда число является простым числом
    }
}
