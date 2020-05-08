import UIKit

// array for checking maxHeapify func
var restoreGrowthPropInArray: ArraySlice<Int> = [0,17,4,13,14,15,11,8,9,1,12,2,10]
var array: ArraySlice<Int> = []
// arrays for checking arrayToHeap func
var sortArray: ArraySlice<Int> = [0,10,15,5,4,12,11,8,9,1,5,30,13]
var indicator = true

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
    if indicator {
        array = arr[1..<arr.count]
        indicator = false
    }
    let l = 2*index
    let r = 2*index+1
    var max = index
    if (l <= array.count && array[l] > array[index]) {
        max = l
    }
    if (r <= array.count && array[r] > array[max]) {
        max = r
    }
    if max != index {
        array = swapElements(arr: array, firstIndex: index, secondIndex: max)
        maxHeapify(arr: array, index: max)
    }
    return array
}


// this func from an arbitrary array get array, that can represent as heap
func arrayToHeap(arr: ArraySlice<Int>) -> ArraySlice<Int> {
    let count = arr.count - 1
    var i = count/2
    while (i > 0) {
        maxHeapify(arr: arr, index: i)
        i -= 1
    }
    indicator = true
    return array
}

// this func sorting array

func heapSort(arr: ArraySlice<Int>) -> ArraySlice<Int> {
    var heapArray = arrayToHeap(arr: arr)
    var count = arr.count - 1
    var i = count
    while (i > 1) {
        heapArray = swapElements(arr: heapArray, firstIndex: 1, secondIndex: i)
        heapArray = heapArray.dropLast()
        maxHeapify(arr: heapArray, index: 1)
    }
    return heapArray
}

heapSort(arr: sortArray)










