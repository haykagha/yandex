import UIKit

// This program considers the minimum number of keystrokes of the letter keys on the keyboard during auto-completion

var mySentence = "Hello my name is Hayk name my Hayk"

var array1 : [String] =  mySentence.components(separatedBy: " ")

func numberOfLetters(array: [String]) {
    
    var numberOfClicks : Int = array.first!.count
    if array.count > 0 {
        
        var countOfNotEqual: Int = 0
        
        var array1 : [String] = array
        var array2 : [String] = [array.first!]
        
        array1.removeFirst()
        
        for i in array1 {
            for j in array2 {
                if i != j {
                    countOfNotEqual += 1
                } else {
                    numberOfClicks += 1
                    break
                }
            }
            if countOfNotEqual == array2.count {
                numberOfClicks += i.count
                array1.removeFirst()
                array2.append(i)
            }
            countOfNotEqual = 0
        }
        print("Тhe number of letters to print is \(numberOfClicks)")
    } else {
        print("Тhe number of letters to print is 0")
    }
}

numberOfLetters(array: array1)


