import UIKit


// Method of sort by fon Neiman
//[1,8,2,1,4,7,3,2,3,6] [10,2,3,8,6,1,3,2,1,11,2]
var sortThisArray = [10,2,3,8,6,1,3,2,1,11,2]
var inversionCount: Int = 0

print("Sort array \(sortThisArray) by method fon Neiman\n")

func merge(array1: [Int], array2: [Int]) -> [Int] {
    let n = array1.count
    let m = array2.count
    var sortedArray = [Int]()
    var i: Int = 0
    var j: Int = 0
    while (i + j < n + m) {
        if (j == m) || ( i < n && array1[i] <= array2[j]) {
            inversionCount += j
            sortedArray.append(array1[i])
            i += 1
        } else {
            sortedArray.append(array2[j])
            j += 1
        }
        
    }
    return sortedArray
}

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

// inversion count is
print("\nInversion count is \(inversionCount)")

