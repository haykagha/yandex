import UIKit

// number of inhabitants of SortLand
let n: Int = 9

// residents income of SortLand

let incomeArray: [Int] = [100, 25, 100000, 5, 780, 360, 600, 500, 850]

// bubble sorting

func bubbleSort(array: [Int]) -> [Int] {
    let N = incomeArray.count
    var sortArray = array
    for i in 0..<N - 1 {
        for j in 0..<N-1-i {
            if sortArray[j] > sortArray[j+1] {
                let c = sortArray[j]
                sortArray[j] = sortArray[j+1]
                sortArray[j+1] = c
            }
        }
    }
    
    
    
    return sortArray
}

let sortedArray = bubbleSort(array: incomeArray)

func personsArray(array: [Int])  {
    for (index,i) in incomeArray.enumerated() {
        switch i {
        case array[0]:
            print("Min income have person_\(index) = \(i)\n")
        case array[array.count / 2]:
            print("Average income have person_\(index) = \(i)\n")
        case array[array.count - 1]:
            print("Max income have person_\(index) = \(i)\n")
        default:
            continue
        }
    }
}

func runningTime(code: () -> ()) -> Double {
    let startTime = CFAbsoluteTimeGetCurrent()
    code()
    let duration = CFAbsoluteTimeGetCurrent() - startTime
    return duration
}



// Sorting time of the array
runningTime {
    personsArray(array: sortedArray)
}






