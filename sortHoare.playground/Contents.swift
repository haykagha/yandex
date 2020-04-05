import UIKit

// This programm sorts array of numbers by Hoare method (quick sort)

// array examples
//[9,8,7,6,5,4,3,2,1]
//[42, 12, 88, 62, 63, 56, 1, 77, 88, 97, 97, 20, 45, 91, 62, 2, 15, 31, 59, 5]

var sortThisArray = [10,2,14,13,1,5,6,8,9,3]
let count = sortThisArray.count

// this func replace two elements in array
func swap(left: Int, right: Int) {
    var buf: Int = 0
    buf = sortThisArray[left]
    sortThisArray[left] = sortThisArray[right]
    sortThisArray[right] = buf
}


// this func is Hoare sort
func sortHoare(left: Int, right: Int) -> [Int] {
    
    var i = left
    var j = right
    
    var pivotIndex = left + (right - left)/2
    let pivot = sortThisArray[pivotIndex]
    
    
    swap(left: pivotIndex, right: right)
    pivotIndex = right
    
    while ( i <= j ) {
        while (sortThisArray[i] < pivot) {
            i += 1
        }
        while (sortThisArray[j] > pivot ) {
            j -= 1
        }
        if i <= j {
            swap(left: i, right: j)
            i += 1
            j -= 1
        }
    }
    if j > left {
        sortHoare(left: left, right: j)
    }
    if i < right  {
        sortHoare(left: i, right: right)
    }
    
    return sortThisArray
}


sortHoare(left: 0, right: count - 1)



