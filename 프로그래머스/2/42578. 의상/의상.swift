import Foundation

func solution(_ clothes:[[String]]) -> Int {
    var clothesType: [String: Int] = [:]
    
    for cloth in clothes {
        let type = cloth[1]
        clothesType[type, default: 0] += 1
    }
    
    var result = 1
    
    for count in clothesType.values {
        result *= count + 1
    }
    
    return result - 1
}