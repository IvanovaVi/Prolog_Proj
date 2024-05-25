import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Test


internal class FunctionsTest {

    private lateinit var main: Main

    @Test
    fun mult() {
        main = Main()
        val expected = 12
        assertEquals(expected, main.mult(134), "Expected multiplication of 134 to be 12")
    }

    @Test
    fun max_not_3(){
        main = Main()
        val expected = 7
        assertEquals(expected, main.max_not_3(37), "Expected found of 37 to be 7")
    }

    @Test
    fun count_Div(){
        main = Main()
        val expected = 4
        assertEquals(expected, main.count_Div(10), "Expected found 4 Divs for 10")
    }

    @Test
    fun mult_dw() {
        main = Main()
        val expected = 12
        assertEquals(expected, main.mult(134), "Expected multiplication of 134 to be 12")
    }

    @Test
    fun mult_up() {
        main = Main()
        val expected = 12
        assertEquals(expected, main.mult(134), "Expected multiplication of 134 to be 12")
    }

    @Test
    fun max_not_div_3_up(){
        main = Main()
        val expected = 7
        assertEquals(expected, main.max_not_3(37), "Expected found of 37 to be 7")
    }

    @Test
    fun max_not_div_3_dw(){
        main = Main()
        val expected = 7
        assertEquals(expected, main.max_not_3(37), "Expected found of 37 to be 7")
    }

    @Test
    fun count_div_dw(){
        main = Main()
        val expected = 4
        assertEquals(expected, main.count_Div(10), "Expected found 4 Divs for 10")
    }

    @Test
    fun count_div_up(){
        main = Main()
        val expected = 4
        assertEquals(expected, main.count_Div(10), "Expected found 4 Divs for 10")
    }

    @Test
    fun one_Arg() {
        val main = Main()
        val expected = 4
        assertEquals(expected,main.one_Arg(10){a -> main.count_div_dw(a)})
    }

    @Test
    fun two_Args() {
        val main = Main()
        val expected = 4
        assertEquals(expected,main.two_Args(10,1){a, b -> main.count_div_up(a, b)})
    }
}
