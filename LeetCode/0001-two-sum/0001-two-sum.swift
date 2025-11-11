class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var table: [Int: Int] = [:]
        
        for i in 0..<nums.count {
            if let index = table[target - nums[i]] {
                return [index, i]
            }
            table[nums[i]] = i
        }
        
        return []
    }
}
