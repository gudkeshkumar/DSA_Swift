import UIKit

class BinarySearchTree {
    var value: Int
    var left: BinarySearchTree?
    var right: BinarySearchTree?
    
    init(withValue value: Int) {
        self.value = value
        left = nil
        right = nil
    }
    
    func insert(_ val: Int) -> BinarySearchTree? {
        if (val > self.value) {
            if self.right != nil {
                self.right = self.right?.insert(val)
            } else {
                self.right = BinarySearchTree.init(withValue: val)
            }
        } else {
            if (self.left != nil) {
                self.left = self.left?.insert(val)
            } else {
                self.left = BinarySearchTree.init(withValue: val)
            }
        }
        return self
    }
    
    func traverse() {
        self.left?.traverse()
        print(self.value)
        self.right?.traverse()
    }
    
}






