import UIKit
// we want to find element in binary search tree
var binarySearchTree: [Int] = [16,13,20,5,14,17,21]
var arrayForChekingRemoveFunc: [Int?] = [12,3,20,1,7,15,nil,nil,nil,nil,nil,nil,17]
var elementIndex: String = ""
// node's struct in tree
struct Node {
    var key: Int
    var leftChild: Int
    var rightChild: Int
    var parent: Int
    
    init(i: Int) {
        self.key = i
        self.leftChild = 2*i+1
        self.rightChild = 2*i+2
        self.parent  = (i - 1)/2
    }
    
}
// func that find element in our array
func searchElement(element: Int, node: Node) -> String{
    
    if node.key >= binarySearchTree.count {
        return "element that we search doesn't exicting in our array"
        
    }
    if element == binarySearchTree[node.key] {
        return "element index, that we search is \(node.key)"
    }
    
    if element < binarySearchTree[node.key] {
        return searchElement(element: element, node:Node(i: node.leftChild))
    } else {
        return searchElement(element: element, node: Node(i: node.rightChild))
    }
}

searchElement(element: 5, node: Node(i: 0))


// we can find min and max elements in our array of numbers

//func that find min element
func minElement(node: Node) -> Int {
    if node.leftChild >= binarySearchTree.count {
        return node.key
    } else {
        return minElement(node: Node(i: node.leftChild))
    }
}

minElement(node: Node(i: 0))

//func that find max element index
func maxElement(node: Node) -> String {
    if node.rightChild >= binarySearchTree.count {
        return "max element is \(binarySearchTree[node.key])"
    } else {
        return maxElement(node: Node(i: node.rightChild))
    }
}

maxElement(node: Node(i: 0))


//func that find the next item index
func findNextItem(node: Node) -> Int?{
    // if node has rightChild, then:
    if node.rightChild < binarySearchTree.count {
        return minElement(node: Node(i: node.rightChild))
    }
    // if node hasn't rightChild, then:
    var x = node
    var y = Node(i: x.parent)
    while y.key < binarySearchTree.count && x.key == y.rightChild  {
        x = y
        y = Node(i: y.parent)
    }
    if y.key < binarySearchTree.count {
        return y.key
    } else {
        return nil
    }
}

//if node has rightChild
findNextItem(node: Node(i: 0))
// if node hasn't rightChild:
findNextItem(node: Node(i: 5))



// this func adding new element in array and return his index
func addNewElement(node: Node,addElement: Int) -> Int {
    if node.key >= binarySearchTree.count {
        return node.key
    }
    if addElement < binarySearchTree[node.key] {
        return addNewElement(node: Node(i: node.leftChild), addElement: addElement)
    } else {
        return addNewElement(node: Node(i: node.rightChild), addElement: addElement)
    }
}


addNewElement(node: Node(i: 0), addElement: 5)


// Remove element from binarySearch

// this func remove node, that has only maximum one child
func remove1(x: Node)-> [Int?] {
    var bool: Bool = false
    if arrayForChekingRemoveFunc[x.leftChild] == nil {
        arrayForChekingRemoveFunc[x.key] =  arrayForChekingRemoveFunc[x.rightChild]
    }
    if arrayForChekingRemoveFunc[x.rightChild] == nil {
           arrayForChekingRemoveFunc[x.key] =  arrayForChekingRemoveFunc[x.leftChild]
            bool = true
       }
    if bool {
        arrayForChekingRemoveFunc[x.leftChild] = nil
    } else {
        arrayForChekingRemoveFunc[x.rightChild] = nil
    }
    return arrayForChekingRemoveFunc
}


//remove1(x: Node(i: 3))


// this func remove node, that has two children
func remove2(x: Node)->[Int?] {
    var nextNodeIndex: Int = findNextItem(node: x)!
    arrayForChekingRemoveFunc[x.key] = arrayForChekingRemoveFunc[nextNodeIndex]
    remove1(x: Node(i: nextNodeIndex))
    return arrayForChekingRemoveFunc
}

//remove2(x: Node(i: 0))


// this func remove element from binary search

func remove(removeNode: Node, fromNode: Node) -> [Int?]  {
    if arrayForChekingRemoveFunc[removeNode.key]! < arrayForChekingRemoveFunc[fromNode.key]! {
        return remove(removeNode: Node(i: removeNode.key), fromNode: Node(i: fromNode.leftChild))
    }
    if arrayForChekingRemoveFunc[removeNode.key]! > arrayForChekingRemoveFunc[fromNode.key]! {
        return remove(removeNode: Node(i: removeNode.key),fromNode: Node(i: fromNode.rightChild))
    }
    if removeNode.rightChild >= arrayForChekingRemoveFunc.count || removeNode.leftChild >= arrayForChekingRemoveFunc.count {
        return remove1(x: removeNode)
    } else {
        return remove2(x: removeNode)
    }
}

remove(removeNode: Node(i: 1),fromNode: Node(i: 0))
