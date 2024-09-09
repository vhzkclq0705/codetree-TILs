import Foundation

func solution() {
    let n = Int(readLine()!)!
    var board = [[Int]](repeating: [Int](repeating: 0, count: 101), count: 101)
    let dxy = [(0, -1), (0, 1), (-1, 0), (1, 0)]
    var ans = 0

    for _ in 0..<n {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        let (x, y) = (input[0], input[1])

        for i in x..<x + 10 {
            for j in y..<y + 10 {
                board[i][j] = 1
            }
        }
    }

    for x in 1..<101 {
        for y in 1..<101 where board[x][y] == 1 {
            for (dx, dy) in dxy {
                let nx = x + dx
                let ny = y + dy

                if nx < 1 || nx > 100 || ny < 1 || ny > 100 || board[nx][ny] == 0 {
                    ans += 1
                }
            }
        }
    }

    print(ans)
}

solution()