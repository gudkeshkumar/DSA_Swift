import UIKit

enum StackError: Error {
    case EMPTY_ERROR
    case OVERFLOW
}

func example(of: String, _ completion: @escaping()-> Void) {
    print("------ Example of \(of) ------")
    completion()
}

// Stack Datastructure
class StackClass<Element> {

    private var array = [Element]()
    private var top: Int = -1

    func isEmpty() -> Bool {
        return top == -1
    }

    func push( _ item: Element) {
        top += 1
        if array.count == top {
            let newSize = array.count * 2
            array.reserveCapacity(newSize)
        }
        array.append(item)
    }

    func peek() throws  -> Element  {
        guard top != -1 else {
            throw StackError.EMPTY_ERROR
        }
        return array[top]
    }

    func pop() {
        guard top != -1 else {
            print("Stack is Empty")
            return
        }
        top -= 1
        array.popLast()
    }
}

public struct Stack<Element> {
    private var storage: [Element] = []
    public init(){}
    
    public init(_ array: [Element]) {
        storage = array
    }
    
    public mutating func push(_ value: Element) {
        storage.append(value)
    }
    
    @discardableResult
    public mutating func pop() -> Element? {
       return storage.popLast()
    }
    
    @discardableResult
    public func peek() -> Element? {
       return storage.last
    }
    
    public  var isEmpty: Bool {
        return peek() == nil
    }
}

extension Stack: ExpressibleByArrayLiteral {
    public typealias ArrayLiteralElement = Element
    
    public init(arrayLiteral elements: Element...) {
        storage = elements
    }
}


extension Stack: CustomStringConvertible {
    
    public var description: String {
        let topDivider = "------Top------\n"
        
        let bottomDivider = "\n------Bottom------"
        
        let stackElements = storage.map{"\($0)"}.reversed().joined(separator: "\n")
        
        return topDivider + stackElements + bottomDivider
    }
}

example(of: "create stack using array") {
    var stack: Stack = [1,2,3,4,5,6,7]
    print(stack)
    stack.pop()
    stack.pop()
    print(stack)
}

