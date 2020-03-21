import UIKit

// According to the method "Insertion sort" we sort the array of numbers.

// Algorithm complexity O(n)

var arrayOfNumbers1 = [Int]()

// Algorithm complexity O(n^2)

var arrayOfNumbers2 = [Int]()

// The array is not empty

for i in 1...1000 {
    arrayOfNumbers1.append(i)
    arrayOfNumbers2.append(1001 - i)
}




func insertNumberInArray(number: Int, array: [Int]) -> [Int] {
    var initialArray = array
    var index = initialArray.count - 1
    var enteredCycle: Bool = false
    while (number < initialArray[index]) {
        if index == 0 {
            enteredCycle = true
            break
        }
        index -= 1
    }
    if index == 0 && enteredCycle == true {
        initialArray.insert(number, at: 0)
    } else {
        initialArray.insert(number, at: index + 1)
    }
    return initialArray
}



func insertionSort(array: [Int]) -> [Int] {
    var initialArray = array
    var sortArray = [Int]()
    sortArray.append(initialArray.first!)
    initialArray.removeFirst()
    for i in initialArray {
        sortArray = insertNumberInArray(number: i, array: sortArray)
    }
    return sortArray
}





func timeElapsedInSecondsWhenRunningCode(operation: ()->()) -> Double {
    let startTime = CFAbsoluteTimeGetCurrent()
    operation()
    let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
    return Double(timeElapsed)
}



// Sorting time of the first array
timeElapsedInSecondsWhenRunningCode {
    insertionSort(array: arrayOfNumbers1)
}

insertionSort(array: arrayOfNumbers1)

// Sorting time of the second array
timeElapsedInSecondsWhenRunningCode {
    insertionSort(array: arrayOfNumbers2)
}

insertionSort(array: arrayOfNumbers2)






