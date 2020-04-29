import UIKit


// Fisrt element in this array equal 0. This in order to increase
// array's count by one, beacause in heap indexеs start with the fisrt.

var isThisArrayHeap = [0,15,13,12,11,15,8,6,5,3,2]
let arrayLentgh = isThisArrayHeap.count


func ifArrayIsHeap(array: [Int]) -> String {
    var indicator = ""
    var count = 0
    var elementNumber = 0
    
    for i in 1...arrayLentgh / 2 {
        elementNumber += 1
        if 2*i < arrayLentgh {
            if isThisArrayHeap[2*i] <= isThisArrayHeap[i] {
                count += 1
                print("Right child for Element-\(elementNumber) exists")
            } else {
                print("This array is not heap\n")
            }
        }
        if (2*i+1) < arrayLentgh {
            if (isThisArrayHeap[2*i+1] <= isThisArrayHeap[i]) {
                count += 1
                print("Left  child for Element-\(elementNumber) exists\n")
            } else {
                print("This array is not heap\n")
            }
        }
    }
    
    if count == arrayLentgh - 2 {
        indicator = "This array is heap"
    } else {
        indicator = "This array is not heap"
    }
    return indicator
}

ifArrayIsHeap(array: isThisArrayHeap)

