import UIKit

// array for checking maxHeapify func
var restoreGrowthPropInArray: ArraySlice<Int> = [17,4,13,14,15,11,8,9,1,12,2,10]
var array: ArraySlice<Int> = []
var recursionCount = 0
// arrays for checking arrayToHeap func
var sortArray: ArraySlice<Int> = [10,15,5,4,12,11,8,9,1,5,30,13]
var sortThisArrayToo: ArraySlice<Int> = [9,8,7,6,5,4,3,2,1]


// swaps elements in an array
func swapElements(arr: ArraySlice<Int>, firstIndex: Int, secondIndex: Int) -> ArraySlice<Int> {
    var array = arr
    let buf = array[firstIndex]
    array[firstIndex] = array[secondIndex]
    array[secondIndex] = buf
    return array
}

// this func restores heap growth properties
func maxHeapify(arr: ArraySlice<Int>, index:Int) -> ArraySlice<Int> {
    if recursionCount == 0 {
        array = arr
    }
    let l = 2*index+1
    let r = 2*index+2
    var max = index
    if l < array.count {
        if array[l] > array[index] {
            max = l
        }
    }
    if r < array.count {
        if array[r] > array[max] {
            max = r
        }
    }
    if max != index {
        array = swapElements(arr: array, firstIndex: index, secondIndex: max)
        maxHeapify(arr: array, index: max)
        recursionCount += 1
    }
    return array
}
 



// this func from an arbitrary array get array, that can represent as heap
func arrayToHeap(arr: ArraySlice<Int>) -> ArraySlice<Int> {
    var buf: ArraySlice<Int> = arr
    let count = arr.count - 1
    var i = count / 2
    while (i >= 0) {
        buf = maxHeapify(arr: buf, index: i)
        recursionCount = 0
        i -= 1
    }
    return buf
}

// this func sorts array
func heapSort(arr: ArraySlice<Int>) -> ArraySlice<Int> {
    
    var heapArray = arrayToHeap(arr: arr)
    
    var array: ArraySlice<Int> = []
    
    var count = arr.count
    
    var i = count
    
    while (i > 0) {
        heapArray = swapElements(arr: heapArray, firstIndex: 0, secondIndex: heapArray.count - 1)
        array.insert(heapArray.last!, at: 0)
        heapArray = heapArray.dropLast()
        heapArray = maxHeapify(arr: heapArray, index: 0)
        recursionCount = 0
        i -= 1
    }
    return array
}

heapSort(arr: sortArray)
heapSort(arr: sortThisArrayToo)
