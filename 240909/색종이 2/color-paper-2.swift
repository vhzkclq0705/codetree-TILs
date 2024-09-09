import Foundation

func solution(_ papers: [(Int, Int)]) -> Int {
    let size = 100
    var board = Array(repeating: Array(repeating: false, count: size), count: size)
    let dxy = [(0, 1), (1, 0), (0, -1), (-1, 0)]
    var ans = 0
    
    for (x, y) in papers {
        for i in x..<min(x + 10, size) {
            for j in y..<min(y + 10, size) {
                board[i][j] = true
            }
        }
    }
    
    for x in 0..<size {
        for y in 0..<size where board[x][y] {
            for (dx, dy) in dxy {
                let nx = x + dx
                let ny = y + dy
                if nx < 0 || nx >= size || ny < 0 || ny >= size || !board[nx][ny] {
                    ans += 1
                }
            }
        }
    }
    
    return ans
}

let n = Int(readLine()!)!
let papers = (0..<n).map { _ in
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    return (input[0], input[1])
}

print(solution(papers))