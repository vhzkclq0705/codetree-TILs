import Foundation

func solution(_ n: Int) -> [Int] {
    var ans = [0, 2]

    func recursion(_ idx: Int, _ ans: inout [Int]) {
        if idx - 1 == n {
            return
        }
        ans.append(ans[idx / 2] + ans[idx - 1])

        recursion(idx + 1, &ans)
    }

    recursion(2, &ans)
    ans.removeFirst()

    return ans
}

let n = Int(readLine()!)!
let result = solution(n).map { String($0) }.joined(separator: " ")

print(result)