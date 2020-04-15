import UIKit

// this program multiplies all elements of two arrays and sums every tenth element
var firtArray: [Int] = [5,6,7,8,9]
var secondArray: [Int] = [2,6,8,10,11]


func multiplyArray(first: [Int], second: [Int]) -> Int {
    var sum = 0
    var count = 0
    for i in 0..<first.count {
        for j in 0..<second.count {
                if ((count + j) % 10 == 0) {
                    sum += first[i]*second[j]
                    print("A[\(i)] is \(first[i])\nB[\(j)] is \(second[j])\nMultiply is \(first[i]*second[j])\n ")
                }
            }
            count += 5
        }
    return sum
}


multiplyArray(first: firtArray, second: secondArray)



