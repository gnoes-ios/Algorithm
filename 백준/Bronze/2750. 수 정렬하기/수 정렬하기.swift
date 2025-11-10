import Foundation

let n = Int(readLine()!)!
var arr: [Int] = []

for _ in 0..<n {
    let num = Int(readLine()!)!
    arr.append(num)
}

arr.sorted().forEach { print($0) }
