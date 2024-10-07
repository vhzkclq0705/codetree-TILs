import Foundation

struct PositionState: Hashable {
    let position: Int
    let jump: Int

    init(_ position: Int, _ jump: Int) {
        self.position = position
        self.jump = jump
    }
}

func bfs(_ n: Int, _ blocked: Set<Int>) -> Int {
    var idx = 0
    var queue = [(PositionState(1, 1), 1)]
    var visited = Set<(PositionState)>()
    visited.insert(PositionState(1, 1))

    while idx < queue.count {
        let (state, cnt) = queue[idx]
        idx += 1

        if state.position == n {
            return cnt
        }

        for dx in [state.jump - 1, state.jump, state.jump + 1] {
            let nx = state.position + dx
            if dx >= 1 && nx <= n && !blocked.contains(nx) && !visited.contains(PositionState(nx, dx)) {
                visited.insert(PositionState(nx, dx))
                queue.append((PositionState(nx, dx), cnt + 1))
            }
        }
    }

    return -1
}

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (input[0], input[1])
let blocked = (0..<m).reduce(into: Set<Int>()) { s, _ in
    s.insert(Int(readLine()!)!)
}

print(bfs(n, blocked))