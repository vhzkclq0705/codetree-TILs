import Foundation

func solution() {
    let n = Int(readLine()!)!
    var board = [[Int]](repeating: [Int](repeating: 0, count: 100), count: 100)
    let dxy = [(0, -1), (0, 1), (-1, 0), (0, 1)]
    var ans = 0

    for _ in 0..<n {
        let paper = readLine()!.split(separator: " ").map { Int($0)! }

        for i in paper[0]..<paper[0] + 10 {
            for j in paper[1]..<paper[1] + 10 {
                board[i][j] = 1
            }
        }
    }

    for x in 0..<100 {
        for y in 0..<100 where board[x][y] == 1 {
            let cnt = dxy.reduce(into: 0) {
                let nx = $1.0 + x
                let ny = $1.1 + y

                if nx >= 0 && nx < 100 && ny >= 0 && ny < 100 {
                    $0 += board[x + $1.0][y + $1.1] == 0 ? 1 : 0
                }
            }
            ans += cnt
        } 
    }

    print(ans)
}

solution()