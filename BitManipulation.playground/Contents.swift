import Foundation

/*
 Max AND pair in given array of integers
 */

func maxAndPair(_ arr: [Int]) -> Int {
    var ans = 0
    var ar = arr
    var i: Int = 31
    while i >= 0 {
        var tmp = [Int]()
        for j in ar {
            
            if (j & (1 << i)) != 0 {
                tmp.append(j)
            }
        }
        //print(tmp)
        if tmp.count >= 2 {
            ans += (1 << i)
            ar = tmp
        }
        
        
        i -= 1
    }
    return ans
}

maxAndPair([2,19,3,83,6,20,9,48,17,18])
