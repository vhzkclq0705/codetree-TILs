import Foundation

func bfs(_ nums: inout [Int], _ blocked: Set<Int>) {
    var idx = 0
    var queue = [1]
    nums[1] = 1

    while idx < queue.count {
        let x = queue[idx]
        idx += 1
        let dx = [x - 1, x * 2, x + 1]

        for nx in [x - 1, x * 2, x + 1] {
            if 0 <= nx && nx < nums.count && !blocked.contains(nx) && nums[nx] == 10001 {
                nums[nx] = nums[x] + 1
                queue.append(nx)
            }
        }
    }
}

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (input[0], input[1])
var nums = Array(repeating: 10001, count: n)
let blocked = (0..<m).reduce(into: Set<Int>()) { s, _ in
    s.insert(Int(readLine()!)!)
}

bfs(&nums, blocked)

print(nums.last!)