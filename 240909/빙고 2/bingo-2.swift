import Foundation

func solution(_ board: [[Int]], _ numbers: [Int]) -> Int {
    var checked = Set<Int>()
    var cnt = 0

    for i in 0..<numbers.count {
        checked.insert(numbers[i])

        if checkBoard() >= 3 {
            return i + 1
        }
    }

    func checkBoard() -> Int {
        var cnt = 0

        for row in board {
            if row.allSatisfy({ checked.contains($0) }) {
                cnt += 1
            }
        }

        for col in 0..<5 {
            if (0..<5).allSatisfy({ checked.contains(board[$0][col]) }) {
                cnt += 1
            }
        }

        if (0..<5).allSatisfy({ checked.contains(board[$0][$0]) }) {
            cnt += 1
        }

        if (0..<5).allSatisfy({ checked.contains(board[$0][4 - $0]) }) {
            cnt += 1
        }

        return cnt
    }

    return 0
}

var board = Array(repeating: Array(repeating: 0, count: 5), count: 5)

for i in 0..<5 {
    let row = readLine()!.split(separator: " ").map { Int($0)! }
    for j in 0..<5 {
        board[i][j] = row[j]
    }
}

let numbers = readLine()!.split(separator: " ").map { Int($0)! }

print(solution(board, numbers))