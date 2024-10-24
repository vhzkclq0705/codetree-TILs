import Foundation

struct Piece {
    let type: Int
    let x: Int
    let y: Int
}

func calcuateArea(_ visited: Set<String>) -> Int {
    var cnt = 0

    for x in 0..<n {
        for y in 0..<m where board[x][y] == 0 && !visited.contains("\(x),\(y)") {
            cnt += 1
        }
    }

    return cnt
}

func visitNewArea(_ type: Int, _ x: Int, _ y: Int, _ d: Int) -> Set<String> {
    var visited = Set<String>()

    func isValid(_ x: Int, _ y: Int) -> Bool {
        return x >= 0 && x < n && y >= 0 && y < m && board[x][y] != 6
    }

    func move(_ x: Int, _ y: Int, _ d: Int) {
        let (dx, dy) = dxy[d]
        var nx = x + dx
        var ny = y + dy

        while isValid(nx, ny) {
            visited.insert("\(nx),\(ny)")
            nx += dx
            ny += dy
        }
    }

    switch type {
    case 1:
        move(x, y, d)
    case 2:
        move(x, y, 0)
        move(x, y, 1)
    case 3:
        switch d {
        case 0:
            move(x, y, 0)
            move(x, y, 2)
        case 1:
            move(x, y, 0)
            move(x, y, 3)
        case 2:
            move(x, y, 1)
            move(x, y, 2)
        case 3:
            move(x, y, 1)
            move(x, y, 3)
        default: break
        }
    case 4:
        switch d {
        case 0:
            move(x, y, 0)
            move(x, y, 1)
            move(x, y, 2)
        case 1:
            move(x, y, 0)
            move(x, y, 1)
            move(x, y, 3)
        case 2:
            move(x, y, 0)
            move(x, y, 2)
            move(x, y, 3)
        case 3:
            move(x, y, 1)
            move(x, y, 2)
            move(x, y, 3)
        default: break
        }
    case 5:
        move(x, y, 0)
        move(x, y, 1)
        move(x, y, 2)
        move(x, y, 3)
    default: break
    }

    return visited
}

func dfs(_ idx: Int, _ visited: Set<String>) {
    if idx == pieces.count {
        let cnt = calcuateArea(visited)
        minValue = min(minValue, cnt)
        return
    }

    let piece = pieces[idx]
    let directionCnt: Int
    switch piece.type {
    case 1, 3, 4: directionCnt = 4
    case 2, 5: directionCnt = 1
    default: directionCnt = 0
    }

    for d in 0..<directionCnt {
        let newVisited = visited.union(
            visitNewArea(piece.type, piece.x, piece.y, d)
        )
        dfs(idx + 1, newVisited)
    }

    return
}

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (input[0], input[1])
var board = (0..<n).map { _ -> [Int] in readLine()!.split(separator: " ").map { Int($0)! } }
let dxy = [(0, 1), (0, -1), (1, 0), (-1, 0)]
var pieces = [Piece]()
var minValue = Int.max

for x in 0..<n {
    for y in 0..<m where board[x][y] >= 1 && board[x][y] <= 5 {
        pieces.append(Piece(type: board[x][y], x: x, y: y))
    }
}

dfs(0, [])

print(minValue)