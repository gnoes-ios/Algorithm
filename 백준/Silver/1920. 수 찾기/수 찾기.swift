import Foundation

final class FileIO {
    private let buffer:[UInt8]
    private var index: Int = 0

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(try! fileHandle.readToEnd()!) + [UInt8(0)]
    }

    @inline(__always) private func read() -> UInt8 {
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
    
    @inline(__always) func readInts(count: Int) -> [Int] {
        return (0 ..< count).map { _ in readInt() }
    }
}

let file = FileIO()

let N = file.readInt()
let A = Set(file.readInts(count: N))
let M = file.readInt()

for _ in 0..<M {
    let target = file.readInt()
    A.contains(target) ? print(1) : print(0)
}
