class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        let numSet = Set(nums)
        var maxLen = 0
        
        for num in numSet {
            if !numSet.contains(num - 1) {
                var cur = num
                var len = 1
                
                while numSet.contains(cur + 1) {
                    cur += 1
                    len += 1
                }
                
                maxLen = max(maxLen, len)
            }
        }
        
        return maxLen
    }
}