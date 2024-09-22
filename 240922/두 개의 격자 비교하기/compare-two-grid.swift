import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (input[0], input[1])
let a = (0..<n).map { _ in readLine()!.split(separator: " ").map { Int($0)! } }
let b = (0..<n).map { _ in readLine()!.split(separator: " ").map { Int($0)! } }
var board = Array(repeating: Array(repeating: 0, count: m), count: n)

for i in 0..<n {
    for j in 0..<m {
        if a[i][j] != b[i][j] {
            board[i][j] = 1
        }
    }
}

for i in board {
    print(i.map { String($0) }.joined(separator: " "))
}