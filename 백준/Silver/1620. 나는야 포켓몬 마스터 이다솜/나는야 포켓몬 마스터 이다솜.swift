import Foundation

final class FileIO {
    private let buffer:[UInt8]
    private var index: Int = 0
    
    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(try! fileHandle.readToEnd()!) + [UInt8(0)]
    }
    
    @inline(__always) func read() -> UInt8 {
        defer { index += 1 }
        
        return buffer[index]
    }
    
    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true
        
        while now == 10 || now == 32 { now = read() }
        if now == 45 { isPositive.toggle(); now = read() }
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }
        
        return sum * (isPositive ? 1:-1)
    }
    
    @inline(__always) func readString() -> String {
        var now = read()
        
        while now == 10 || now == 32 { now = read() }
        
        let beginIndex = index-1
        
        while now != 10,
              now != 32,
              now != 0 { now = read() }
        
        return String(bytes: Array(buffer[beginIndex..<(index-1)]), encoding: .ascii)!
    }
    
    @inline(__always) func readStrings(count: Int) -> [String] {
        return (0 ..< count).map { _ in readString() }
    }
}

let file = FileIO()

let N = file.readInt()
let M = file.readInt()

var table1: [Int: String] = .init()
var table2: [String: Int] = .init()

let names = file.readStrings(count: N)

for i in 0..<N {
    table1[i] = names[i]
    table2[names[i]] = i
}

var result: String = ""

for _ in 0..<M {
    let input = file.readString()
    
    if let num = Int(input) {
        result += "\(table1[num - 1]!)\n"
    } else {
        result += "\(table2[input]! + 1)\n"
    }
}

print(result)