class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var table: [String: [String]] = [:]
        
        for str in strs {
            let key = String(str.sorted())
            table[key, default: []].append(str)
        }
        
        return Array(table.values)
    }
}
