import Foundation

let n = Int(readLine()!)!
var board = Array(repeating: Array(repeating: 1, count: n), count: n)

for i in 1..<n {
    for j in 1..<n {
        board[i][j] = board[i - 1][j] + board[i][j - 1] + board[i - 1][j - 1]
    }
}

for i in board {
    print(i.map { String($0) }.joined(separator: " "))
}