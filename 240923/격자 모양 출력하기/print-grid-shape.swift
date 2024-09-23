import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (input[0], input[1])
var board = Array(repeating: Array(repeating: 0, count: n), count: n)

for _ in 0..<m {
    let point = readLine()!.split(separator: " ").map { Int($0)! }
    let (x, y) = (point[0], point[1])

    board[x - 1][y - 1] = x * y
}

for i in board {
    print(i.map { String($0) }.joined(separator: " "))
}