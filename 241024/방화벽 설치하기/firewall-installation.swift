import Foundation

func findEmptyPlaces() -> [(Int, Int)] {
    var emptyPlaces = [(Int, Int)]()

    for x in 0..<n {
        for y in 0..<m where board[x][y] == 0 {
            emptyPlaces.append((x, y))
        }
    }

    return emptyPlaces
}

func getWallCombinations(_ emptyPlaces: [(Int, Int)]) -> [[(Int, Int)]] {
    var combs = [[(Int, Int)]]()

    for i in 0..<emptyPlaces.count {
        for j in (i + 1)..<emptyPlaces.count {
            for k in (j + 1)..<emptyPlaces.count {
                combs.append([emptyPlaces[i], emptyPlaces[j], emptyPlaces[k]])
            }
        }
    }

    return combs
}

func expandFire(_ newWalls: [(Int, Int)]) -> Int {
    var newBoard = board
    var visited = Array(repeating: Array(repeating: false, count: m), count: n)
    var cnt = 0

    for (x, y) in newWalls {
        newBoard[x][y] = 1
    }

    for x in 0..<n {
        for y in 0..<m where !visited[x][y] && newBoard[x][y] == 2 {
            bfs(x, y, &newBoard, &visited)
        }
    }

    for x in 0..<n {
        for y in 0..<m where newBoard[x][y] == 0 {
            cnt += 1
        }
    }

    return cnt
}

func bfs(_ x: Int, _ y: Int, _ newBoard: inout [[Int]], _ visited: inout [[Bool]]) {
    var queue = [(x, y)]
    var idx = 0
    visited[x][y] = true

    while idx < queue.count {
        let (x, y) = queue[idx]
        idx += 1

        for (dx, dy) in dxy {
            let nx = x + dx
            let ny = y + dy

            if nx >= 0 && nx < n && ny >= 0 && ny < m && !visited[nx][ny] && newBoard[nx][ny] == 0 {
                queue.append((nx,ny))
                newBoard[nx][ny] = 2
                visited[nx][ny] = true
            }
        }
    }
}

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (input[0], input[1])
let board = (0..<n).map { _ -> [Int] in readLine()!.split(separator: " ").map { Int($0)! } }
let dxy = [(1, 0), (-1, 0), (0, 1), (0, -1)]
var emptyPlaces = findEmptyPlaces()
var maxValue = 0

var combs = getWallCombinations(emptyPlaces)

for comb in combs {
    let result = expandFire(comb)
    maxValue = max(maxValue, result)
}
print(maxValue)