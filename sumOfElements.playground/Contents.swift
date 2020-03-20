import UIKit

// Implementation of a function that takes one string element
// in which two numbers are written and returns a string element
// in which their sum is written.

let stringNumbers = "10 232131231"

let sumOfElemnets = {
   let numbersArray = stringNumbers.components(separatedBy: " ")
    let sum: String
    var sumOfNumbers: Int = 0
    for i in numbersArray {
        if let intNumber = Int(i) {
           sumOfNumbers += intNumber
        }
    }
    sum = String(sumOfNumbers)
    print("sum of numbers is \(sum)")
}


// runtime of programm
func timeElapsedInSecondsWhenRunningCode(operation: ()->()) -> Double {
    let startTime = CFAbsoluteTimeGetCurrent()
    operation()
    let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
    return Double(timeElapsed)
}

timeElapsedInSecondsWhenRunningCode(operation: sumOfElemnets)




