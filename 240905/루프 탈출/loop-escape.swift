import Foundation

func solution() -> Int {
    let n = Int(readLine()!)!
    let nodes = (0..<n).map { _ in Int(readLine()!)! - 1 }
    var isInCycle = [Bool](repeating: false, count: n)
    var visited = [Int](repeating: 0, count: n)
    
    func dfs(_ node: Int) -> Bool {
        if visited[node] == 1 {
            return true
        }
        if visited[node] == 2 {
            return false
        }

        visited[node] = 1
        let next = nodes[node]
        if next != -1 && dfs(next) {
            isInCycle[node] = true
            return true
        }

        visited[node] = 2
        return false
    }

    for i in 0..<n {
        if visited[i] == 0 {
            dfs(i)
        }
    }

    return isInCycle.filter { !$0 }.count
}

print(solution())