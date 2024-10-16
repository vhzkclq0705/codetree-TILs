import Foundation

func dfs(_ idx: Int, _ d: Int, _ visited: inout [Int]) {
    if idx < 0 || idx > 3 {
        return
    }
    visited[idx] = d

    for i in stride(from: idx - 1, through: 0, by: -1) {
        guard chairs[idx][6] != chairs[i][2] && visited[i] == 0 else {
            break
        }
        dfs(i, -d, &visited)
        break
    }

    for i in (idx + 1)..<4 {
        guard chairs[idx][2] != chairs[i][6] && visited[i] == 0 else {
            break
        }
        dfs(i, -d, &visited)
        break
    }

    return
}

func rotateChairs(_ visited: [Int]) {
    for i in 0..<4 where visited[i] != 0 {
        visited[i] == 1 ? rotateCW(i) : rotateCCW(i)
    }
}

func rotateCW(_ idx: Int) {
    chairs[idx].insert(chairs[idx].popLast()!, at: 0)
}

func rotateCCW(_ idx: Int) {
    chairs[idx].append(chairs[idx].removeFirst())
}

var chairs = (0..<4).map { _ -> [Int] in readLine()!.map { Int(String($0))! } }
let k = Int(readLine()!)!

for _ in 0..<k {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, d) = (input[0], input[1])
    var visited = Array(repeating: 0, count: 4)

    dfs(n - 1, d, &visited)
    rotateChairs(visited)
}

print(chairs[0][0] + chairs[1][0] * 2 + chairs[2][0] * 4 + chairs[3][0] * 8)