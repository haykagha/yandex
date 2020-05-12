import UIKit
// we want to find element in binary search tree
var binarySearchTree: [Int] = [16,13,20,5,14,17,21]
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
func minElement(node: Node) -> String {
    if node.leftChild >= binarySearchTree.count {
        return "min element is \(binarySearchTree[node.key])"
    } else {
        return minElement(node: Node(i: node.leftChild))
    }
}

minElement(node: Node(i: 0))

//func that find max element
func maxElement(node: Node) -> String {
    if node.rightChild >= binarySearchTree.count {
        return "max element is \(binarySearchTree[node.key])"
    } else {
        return maxElement(node: Node(i: node.rightChild))
    }
}

maxElement(node: Node(i: 0))
