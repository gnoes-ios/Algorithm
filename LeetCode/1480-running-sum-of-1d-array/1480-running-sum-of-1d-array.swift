class Solution {
    func runningSum(_ nums: [Int]) -> [Int] {
        nums.reduce(into: []) { result, num in
            result.append((result.last ?? 0) + num)
        }
    }
}