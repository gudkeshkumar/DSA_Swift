import Foundation

//MARK: - Bubble Sort

func bubbleSort(_ array: [Int]) -> [Int] {
    guard array.count > 0 else {
        return array
    }
    var arr = array
    let length = array.count
    
    for i in 0..<(length - 1) {
        for j in 0..<(length - i - 1) {
            if arr[j] > arr[j + 1] {
                (arr[j], arr[j + 1]) = (arr[j + 1], arr[j])
            }
        }
    }
    return arr
}

//MARK: - Selection Sort

func selectionSort(_ array: [Int]) -> [Int] {
    guard array.count > 0 else {
        return array
    }
    var arr = array
    let length = array.count
    var min = 0
    
    for i in 0..<(length - 1) {
        min = i
        for j in i+1..<length - 1{
            if arr[j] < arr[min] {
                min = j
            }
        }
        (arr[i], arr[min]) = (arr[min], arr[i])
    }
    return arr
}



//MARK: - Insertion Sort

func insertionSort(_ array: [Int]) -> [Int] {
    guard array.count > 2 else {
        return selectionSort(array)
    }
    var arr = array
    let length = array.count
    
    for i in 1..<(length - 1) {
        var currentIndex = i - 1
        let currentValue = arr[i]
        while currentIndex >= 0 && arr[currentIndex] > currentValue {
            arr[currentIndex + 1] = arr[currentIndex]
            currentIndex -= 1
        }
        arr[currentIndex + 1] = currentValue
    }
    return arr
}


//MARK: - Merge Sort

func mergeSort(_ array: [Int]) -> [Int] {
    guard array.count > 0 else {
        return array
    }
    if array.count == 1 {
        return array
    }
    let left = 0
    let right = array.count - 1
    let mid = (left + right) / 2
    
    let l1 = mergeSort(Array(array[left...mid]))
    let l2 = mergeSort(Array(array[mid+1...right]))
    return merge(l1,l2)
}

func merge(_ Arr: [Int], _ Brr: [Int]) -> [Int] {
    var array = [Int]()
    let A = Arr
    let B = Brr
    
    var aStart = 0
    var bStart = 0
    while A.count > aStart && B.count > bStart {
        if A[aStart] > B[bStart] {
            array.append(B[bStart])
            bStart += 1
        } else {
            array.append(A[aStart])
            aStart += 1
        }
    }
    
    while A.count > aStart {
        array.append(A[aStart])
        aStart += 1
    }
    while B.count > bStart {
        array.append(B[bStart])
        bStart += 1
    }
    
    return array
}

//MARK: Quick Sort

func swap(_ A: inout [Int], _ i: Int, _ j: Int) {
    let temp = A[i]
    A[i] = A[j]
    A[j] = temp
}


func partition(_ A: inout [Int], _ low: Int, _ high: Int) -> Int {
    let randInd = Int.random(in: low...high)
    swap(&A, randInd, low)
    var pivInd = low
    let pivVal = A[low]
    
    for curInd in low...high {
        if A[curInd] <= pivVal {
            swap(&A, curInd, pivInd)
            pivInd += 1
        }
    }
    swap(&A, pivInd-1, low)
    return pivInd - 1
}

func quickSort(_ A: inout [Int], _ low: Int, _ high: Int) {
    if low < high {
        let pivInd = partition(&A, low, high)
        quickSort(&A, low, pivInd-1)
        quickSort(&A, pivInd+1, high)
    }
}



var arr = [1, 9, 5, 3, 11, 7, 8, 6, 12, 21, 1, 11]
quickSort(&arr, 0, arr.count-1)
print(arr)
