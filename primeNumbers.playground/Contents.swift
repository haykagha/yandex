import UIKit


let n : Int = 5000

var arrayOfPrimeNumbers: [Int] = [2,3,5]

var count: Int = 0

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



