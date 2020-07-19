import UIKit

//MARK: - Linear Search

func linearSearch(array: [Int], value: Int) -> Bool {
    var found = false
    
    for item in array {
        if item == value {
            found = true
            break
        }
    }
    return found
}

//MARK: - Binary Search

func binarySearch(array: [Int], value: Int) -> Bool {
    var found = false
    var lower = 0
    var upper = array.count - 1
    
    while lower < upper {
        let mid = lower + (upper - lower) / 2
        if array[mid] == value {
            found = true
            break
        }
        
        if value < array[mid] {
            upper = mid - 1
        }
        
        if value > array[mid] {
            lower = mid + 1
        }
    }
    return found
}

func recursiveBinarySearch(array: [Int], lower: Int, upper: Int, value: Int) -> Bool {
    if lower <= upper {
        let mid = lower + (upper - lower) / 2
        if array[mid] == value {
            return true
        }
        
        if value > array[mid] {
            return recursiveBinarySearch(array: array, lower: mid + 1, upper: upper, value: value)
        } else {
            return recursiveBinarySearch(array: array, lower: lower, upper: mid - 1, value: value)
        }
        
    }
    return false
}





