import UIKit
// [3,1,2,1,4,6]
var sortThisArray = [4,2,3,1,8,6,7,5,9]
var arrayCount = sortThisArray.count - 1

// we can change the elements of the array that are from each other at a distance to k
var k: Int = 3



func swap(index: Int) {
    var buf = 0
    buf = sortThisArray[index]
    sortThisArray[index] = sortThisArray[index + k]
    sortThisArray[index + k] = buf
}

func sortPugalo() {
    var i = 0
    while ((i+1) <= arrayCount) && (sortThisArray[i] <= sortThisArray[i+1])  {
        i += 1
    }
    if i == arrayCount {
        print("Yes")
        return
    } else {
        if (i + k <= arrayCount) {
            swap(index: i)
        } else {
            print("No")
            return
        }
        sortPugalo()
    }
}


sortPugalo()
print("sorted array by method Pugalo is \(sortThisArray)")
