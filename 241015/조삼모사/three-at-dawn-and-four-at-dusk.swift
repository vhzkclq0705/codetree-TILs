import Foundation

func dfs(_ idx: Int) {
    if idx >= n {
        return
    }

    if morning.count == n / 2 {
        var evening = (0..<n).filter { !morning.contains($0) }
        let mp = caculate(morning)
        let ep = caculate(evening)
        let diff = abs(mp - ep)

        ans = min(diff, ans)

        return
    }

    morning.append(idx)
    dfs(idx + 1)
    morning.removeLast()
    dfs(idx + 1)
}

func caculate(_ arr: [Int]) -> Int {
    var res = 0

    for i in arr {
        for j in arr {
            res += work[i][j]
        }
    }

    return res
}

let n = Int(readLine()!)!
let work = (0..<n).map { _ -> [Int] in readLine()!.split(separator: " ").map { Int($0)! } }
var morning = [Int]()
var ans = Int.max

dfs(0)

print(ans)