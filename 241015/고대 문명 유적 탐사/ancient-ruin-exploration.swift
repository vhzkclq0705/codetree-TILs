import Foundation

func bfs(_ x: Int, _ y: Int, _ board: [[Int]], _ visited: inout [[Bool]]) -> [(Int, Int)] {
    let dxy = [(0, 1), (0, -1), (1, 0), (-1, 0)]
    var queue = [(x, y)]
    var idx = 0
    visited[x][y] = true

    while idx < queue.count {
        let (x, y) = queue[idx]
        idx += 1

        for (dx, dy) in dxy {
            let nx = x + dx
            let ny = y + dy

            if 0 <= nx && nx < 5 && 0 <= ny && ny < 5 && !visited[nx][ny] && board[nx][ny] == board[x][y] {
                visited[nx][ny] = true
                queue.append((nx, ny))
            }
        }
    }

    return queue.count >= 3 ? queue : []
}

func getFistRelics(_ board: [[Int]]) -> Int {
    var visited = Array(repeating: Array(repeating: false, count: 5), count: 5)
    var cnt = 0

    for x in 0..<5 {
        for y in 0..<5 where !visited[x][y] {
            cnt += bfs(x, y, board, &visited).count
        }
    }

    return cnt
}

func getChainedRelics(_ board: inout [[Int]], _ relics: inout [Int]) -> Int {
    var cnt = 0

    while true {
        var visited = Array(repeating: Array(repeating: false, count: 5), count: 5)
        var path = [(Int, Int)]()

        for x in 0..<5 {
            for y in 0..<5 where !visited[x][y] {
                path += bfs(x, y, board, &visited)
            }
        }

        if path.isEmpty {
            break
        }

        path = path.sorted {
            (-$0.1, $0.0) > (-$1.1, $1.0)
        }

        for (x, y) in path {
            board[x][y] = relics.popLast()!
            cnt += 1
        }
    }

    return cnt
}

func reverseBoard(_ x: Int, _ y: Int, _ board: inout [[Int]]) {
    for i in 0..<3 {
        board[x + i][y..<(y + 3)].reverse()
    }
}

func rotate90(_ x: Int, _ y: Int, _ board: [[Int]]) -> [[Int]] {
    var board = board

    for i in 0..<3 {
        for j in i+1..<3 {
            let tmp = board[x + i][y + j]
            board[x + i][y + j] = board[x + j][y + i]
            board[x + j][y + i] = tmp
        }
    }

    reverseBoard(x, y, &board)
    return board
}

func rotate180(_ x: Int, _ y: Int, _ board: [[Int]]) -> [[Int]] {
    var board = board
    
    for i in 0..<3 {
        let tmp = board[x][y + i]
        board[x][y + i] = board[x + 2][y + i]
        board[x + 2][y + i] = tmp
    }

    reverseBoard(x, y, &board)
    return board
}

func rotate270(_ x: Int, _ y: Int, _ board: [[Int]]) -> [[Int]] {
    var board = board
    reverseBoard(x, y, &board)

    for i in 0..<3 {
        for j in i+1..<3 {
            let tmp = board[x + i][y + j]
            board[x + i][y + j] = board[x + j][y + i]
            board[x + j][y + i] = tmp
        }
    }

    return board
}

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (k, m) = (input[0], input[1])
var board = (0..<5).map { _ -> [Int] in readLine()!.split(separator: " ").map { Int($0)! } }
var relics = readLine()!.split(separator: " ").reversed().map { Int($0)! }

for _ in 0..<k {
    var results = [(Int, Int, Int, Int, [[Int]])]()

    for x in 0..<3 {
        for y in 0..<3 {
            let rotated90Board = rotate90(x, y, board)
            let rotated180Board = rotate180(x, y, board)
            let rotated270Board = rotate270(x, y, board)

            let res90 = getFistRelics(rotated90Board)
            let res180 = getFistRelics(rotated180Board)
            let res270 = getFistRelics(rotated270Board)

            if res90 >= 3 {
                results.append((res90, 90, y, x, rotated90Board))
            }
            if res180 >= 3 {
                results.append((res180, 180, y, x, rotated180Board))
            }
            if res270 >= 3 {
                results.append((res270, 270, y, x, rotated270Board))
            }
        }
    }

    if results.isEmpty {
        break
    }

    var rotatedBoard = results.sorted {
        ($0.0, -$0.1, -$0.2, -$0.3) > ($1.0, -$1.1, -$1.2, -$1.3)
    }.first!.4

    let res = getChainedRelics(&rotatedBoard, &relics)
    board = rotatedBoard

    print(res, terminator: " ")
}