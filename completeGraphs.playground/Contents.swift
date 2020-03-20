import UIKit

// Division of personnel into two groups where in each group every two people know each other.

// n - amount of workers
let n = 8

struct Contact: Equatable {
    var contacts: [Int]
    
    var countOfContacts: Int {
        return contacts.count
    }
    
    init(contacts: [Int]) {
        self.contacts = contacts
    }
}

var contact0 = Contact(contacts: [0,1,2,3,4])
var contact1 = Contact(contacts: [0,1,2,3,4])
var contact2 = Contact(contacts: [0,1,2,3,4])
var contact3 = Contact(contacts: [0,1,2,3,4])
var contact4 = Contact(contacts: [0,1,2,3,4])
var contact5 = Contact(contacts: [5,6,7])
var contact6 = Contact(contacts: [5,6,7])
var contact7 = Contact(contacts: [5,6,7])

var arrayOfContacts: [Contact] = [contact0, contact1, contact2, contact3, contact4, contact5, contact6, contact7]
var group1 = [Contact]()
var group2 = [Contact]()
var number: Int = 0


// function that returns the common elements of two arrays.
func commonЕlements(array1: [Int], array2: [Int]) -> [Int] {
    var array = [Int]()
    for i in array1 {
        if array2.contains(i) {
            array.append(i)
        }
    }
    return array
}


// Тhe function takes an array and an array of arrays and returns an array,
// that has the maximum number of elements with the original array
func arrayWithMaxCommonElements(array1: [Int], array2: [[Int]]) -> [Int] {
    var array = [Int]()
    var maxElements: Int = 0
    for i in array2 {
        if commonЕlements(array1: array1, array2: i).count >= maxElements {
            maxElements = commonЕlements(array1: array1, array2: i).count
            array = commonЕlements(array1: array1, array2: i)
        }
    }
    return array
}


//func addContactToGroup creates two groups if it possible
func addContactToGroup(arrayOfContacts: [Contact]) {
    
    var arrayOfPersonsContacts = [[Int]]()
    for i in arrayOfContacts {
        arrayOfPersonsContacts.append(i.contacts)
    }
    
    let group1Vertices = arrayWithMaxCommonElements(array1: arrayOfContacts[0].contacts, array2: arrayOfPersonsContacts)
    
    for i in arrayOfContacts {
        if  commonЕlements(array1: group1Vertices, array2: i.contacts) == group1Vertices {
            group1.append(i)
        } else {
            group2.append(i)
        }
    }
    if isGroupComplete(group2: group2) {
        print("Group1 vertices count are \(group1.count) \nGroup1 Verices are \(group1) Group2 vertices count are \(group2.count) \nGroup2 Vertices are \(group2)")
    } else {
        print("-1")
    }
}

// Is group two complete?
func isGroupComplete(group2: [Contact]) -> Bool {
    var count = 0
    var arrayOfPersonsContacts = [[Int]]()
    for i in group2{
        arrayOfPersonsContacts.append(i.contacts)
    }
    
    let group2Vertices = arrayWithMaxCommonElements(array1: group2[0].contacts, array2: arrayOfPersonsContacts)
    
    for i in group2 {
        if  commonЕlements(array1: group2Vertices, array2: i.contacts) == group2Vertices {
            count += 1
        }
    }
    
    if count == group2.count {
        return true
    } else {
        return false
    }
}


addContactToGroup(arrayOfContacts: arrayOfContacts)










