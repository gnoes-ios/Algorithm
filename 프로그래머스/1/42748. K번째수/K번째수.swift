import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var result: [Int] = []

    commands.forEach {
        let i = $0[0]
        let j = $0[1]
        let k = $0[2]
        
        let num = array[i-1...j-1].sorted()[k-1]
        result.append(num)
    }
    
    return result
}