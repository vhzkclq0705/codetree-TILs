import Foundation

func up(_ board: inout [[Int]], _ cnt: inout Int, _ col: Int) {
    for i in stride(from: n - 1, through: 0, by: -1) {
        board[i][col] = cnt
        cnt += 1
    }
}

func down(_ board: inout [[Int]], _ cnt: inout Int, _ col: Int) {
    for i in 0..<n {
        board[i][col] = cnt
        cnt += 1
    }
}

let n = Int(readLine()!)!
var direction = true // true: up, false: down
var board = Array(repeating: Array(repeating: 0, count: n), count: n)
var cnt = 1

for col in stride(from: n - 1, through: 0, by: -1) {
    if direction {
        up(&board, &cnt, col)
    }
    else {
        down(&board, &cnt, col)
    }

    direction.toggle()
}

for i in board {
    print(i.map { String($0) }.joined(separator: " "))
}