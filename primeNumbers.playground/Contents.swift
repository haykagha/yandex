import UIKit


// prime numbers to n
let n : Int = 5940

func findingPrimeNumbers(number: Int) {
    var count: Int = 0
    var arrayOfPrimeNumbers: [Int] = [2,3,5]
    for i in 6...n {
        for j in arrayOfPrimeNumbers {
            if (i % j == 0) {
                break
            } else {
                count += 1
            }
        }
        if count == arrayOfPrimeNumbers.count {
            arrayOfPrimeNumbers.append(i)
        }
        count = 0
    }
    print(arrayOfPrimeNumbers)
}

print(findingPrimeNumbers(number: n))



