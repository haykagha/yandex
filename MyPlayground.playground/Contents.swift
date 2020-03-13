import UIKit


// n - amount of workers
let n = 5

// m - number of acquaintances in the company
let m: Int?

struct Contact: Equatable {
    var contacts: [Int]
    
    init(contacts: [Int]) {
        self.contacts = contacts
    }
}

var contact1 = Contact(contacts: [2,3])
var contact2 = Contact(contacts: [1,3,4])
var contact3 = Contact(contacts: [1,2,3,4,5])
var contact4 = Contact(contacts: [2,3,5])
var contact5 = Contact(contacts: [3,4])


var arrayOfContacts: [Contact] = [contact1, contact2, contact3, contact4, contact5]
var group1 = [Contact]()
var group2 = [Contact]()
var number: Int = 0

//func addContactToGroup

for (index,i) in arrayOfContacts.enumerated() {
        if i.contacts.isEmpty == false {
            switch number {
            case 0:
                group1.append(i)
                group1.append(arrayOfContacts[i.contacts.first! - 1])
                arrayOfContacts.remove(at: index)
                arrayOfContacts.remove(at: i.contacts.first! - 1)
                number = 1
            case 1:
                group2.append(i)
                group2.append(arrayOfContacts[i.contacts.first! - 1])
                arrayOfContacts.remove(at: index)
                arrayOfContacts.remove(at: i.contacts.first! - 1)
                number = 0
            default:
                print("Wrong Number")
            }
    }
    
    for j in arrayOfContacts {
        if j.contacts.contains(index + 1) ||  {
            j.contacts.filter { $0 != index + 1}
        }
        
    }
}

