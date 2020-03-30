import UIKit


// Method of sort by fon Neiman
var sortThisArray = [10,2,55,2,19,7,77,23]
print("Sort array \(sortThisArray) by method fon Neiman\n")

func merge(array1: [Int], array2: [Int]) -> [Int] {
    let n = array1.count
    let m = array2.count
    var sortedArray = [Int]()
    var i: Int = 0
    var j: Int = 0
    while (i + j < n + m) {
        if (j == m) || ( i < n && array1[i] <= array2[j]) {
            sortedArray.append(array1[i])
            i += 1
        } else {
            sortedArray.append(array2[j])
            j += 1
        }
    }
    return sortedArray
}


merge(array1: [1,2,3,4], array2: [7,7,8,9])




func sortNeiman(array : [Int]) -> [Int] {
    let m = array.count
    let n = array.count / 2
    
    var left = [Int]()
    var right = [Int]()
    var sortedArray = [Int]()
    var array1 = [Int]()
    var array2 = [Int]()
    
    if m == 1 {
        return array
    }
    
    if array.count % 2 == 0 {
        array1 = array.dropLast(n)
        array2 = array.suffix(n)
    } else {
        array1 = array.dropLast(n + 1)
        array2 = array.suffix(n + 1)
    }
    
    left = sortNeiman(array: array1)
    right = sortNeiman(array: array2)
    sortedArray = merge(array1: left, array2: right)
    print("Merging elements \(left) and \(right) and we have \(sortedArray)")
    return sortedArray
}

// running time
func runningTime(code: () -> ()) -> Double {
    let startTime = CFAbsoluteTimeGetCurrent()
    code()
    let duration = CFAbsoluteTimeGetCurrent() - startTime
    print("\nDuration of sort is \(duration)")
    return duration
}

runningTime {
    sortNeiman(array: sortThisArray)
}
