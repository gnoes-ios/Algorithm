class Solution {
    func firstUniqChar(_ s: String) -> Int {
        var table: [Character: Int] = .init()
        
        for char in s {
            table[char, default: 0] += 1
        }
        
        for (index, char) in s.enumerated() {
            if table[char] == 1 {
                return index
            }
        }
        
        return -1
    }
}
