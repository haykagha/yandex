import UIKit

// find the number of inversions in the array


func inversionsCount(array: [Int]) -> Int {
    var count: Int = 0
    
    return count
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
