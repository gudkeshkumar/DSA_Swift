import Foundation

public class DNode<T> {
    var value: T
    var next: DNode?
    
    public init(with value: T, next: DNode? = nil) {
        self.value = value
        self.next = next
    }
}

extension DNode: CustomStringConvertible {
    public var description: String {
        guard let next = self.next else {
            return "\(value)"
        }
        
        return "\(value) ->" + String(describing: next) + " "
    }
    
}

//public class DoublyLinkedList


