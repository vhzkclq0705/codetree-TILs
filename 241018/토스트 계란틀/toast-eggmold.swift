import Foundation

func bfs(_ x: Int, _ y: Int, _ visited: inout [[Bool]]) -> Int {
    var queue = [(x, y)]
    var idx = 0
    var sum = eggs[x][y]
    visited[x][y] = true
    
    while idx < queue.count {
        let (x, y) = queue[idx]
        idx += 1

        for (dx, dy) in [(1, 0), (0, 1), (-1, 0), (0, -1)] {
            let nx = x + dx
            let ny = y + dy

            if nx >= 0 && nx < n && ny >= 0 && ny < n {
                let diff = abs(eggs[x][y] - eggs[nx][ny])
                if !visited[nx][ny] && (diff >= L && diff <= R) {
                    visited[nx][ny] = true
                    queue.append((nx, ny))
                    sum += eggs[nx][ny]
                }
            }
        }
    }

    if queue.count == 1 {
        return 0
    }

    let avg = sum / queue.count
    for (x, y) in queue {
        eggs[x][y] = avg
    }

    return 1
}

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, L, R) = (input[0], input[1], input[2])
var eggs = (0..<n).map { _ -> [Int] in readLine()!.split(separator: " ").map { Int($0)! } }
var cnt = 0

while true {
    var visited = Array(repeating: Array(repeating: false, count: n), count: n)
    var flag = 0

    for x in 0..<n {
        for y in 0..<n where !visited[x][y] {
            flag += bfs(x, y, &visited)
        }
    }

    if flag == 0 {
        break
    }
    cnt += 1
}

print(cnt)