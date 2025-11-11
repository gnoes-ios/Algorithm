let n = Int(readLine()!)!
let nSet = Set(readLine()!.split(separator: " ").map { Int($0)! })

let m = Int(readLine()!)!
let mArr = readLine()!.split(separator: " ").map { Int($0)! }

for num in mArr {
    if nSet.contains(num) {
        print(1)
    } else {
        print(0)
    }
}
