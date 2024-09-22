import Foundation

let board = (0..<4).map { _ in readLine()!.split(separator: " ").map { Int($0)! } }
var ans = 0

for i in 0..<4 {
    for j in 0...i {
        ans += board[i][j]
    }
}

print(ans)