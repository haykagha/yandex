import UIKit
// binary search in sorted array
var searchElementInThisArray = [1,2,3,4,5,6,7,8,9]

func searchElement(array: [Int],element:Int)-> Int {
    var index: Int = 0
    var l = -1
    var r = array.count
    var m = 0
    while (r > l + 1) {
        m = (r+l)/2
        if array[m] >= element {
            r = m
        } else {
            l = m
        }
    }
    if r < array.count && array[r] == element {
        index = r
    } else {
        index = -1
    }
    return index
}

searchElement(array: searchElementInThisArray, element: 9)
