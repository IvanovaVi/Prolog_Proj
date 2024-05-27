import java.io.File
import java.lang.System.`in`
import java.util.*
import kotlin.math.max
import kotlin.sequences.sequence as sequence
import java.math.BigInteger

class ProblemEuler{

    fun countEvenNumbersNotCoprimeWithN(n: BigInteger): Int {
        return if (n == BigInteger.ZERO) 0 else countEvenNumbersNotCoprimeWithNHelper(n, BigInteger.ONE)
    }

    private fun countEvenNumbersNotCoprimeWithNHelper(n: BigInteger, current: BigInteger): Int {
        return if (current > n) 0 else {
            val gcd = n.gcd(current)
            if (gcd!= BigInteger.ONE && current.mod(2) == BigInteger.ZERO) 1 + countEvenNumbersNotCoprimeWithNHelper(n, current.add(BigInteger.ONE))
            else countEvenNumbersNotCoprimeWithNHelper(n, current.add(BigInteger.ONE))
        }
    }

    fun productAndSumOfNumbers(n: BigInteger): Pair<BigInteger, BigInteger> {
        return if (n == BigInteger.ZERO) Pair(BigInteger.ZERO, BigInteger.ZERO) else productAndSumOfNumbersHelper(n, BigInteger.ONE)
    }

    private fun productAndSumOfNumbersHelper(n: BigInteger, current: BigInteger): Pair<BigInteger, BigInteger> {
        val gcd = n.gcd(current)
        return if (gcd!= BigInteger.ONE && current < n && current.mod(2) >= BigInteger.FIVE) {
            val nextPair = productAndSumOfNumbersHelper(n, current.add(BigInteger.ONE))
            Pair(nextPair.first * current, nextPair.second + current)
        } else {
            productAndSumOfNumbersHelper(n, current.add(BigInteger.ONE))
        }
    }

}

