import Foundation

func findPositions(_ num: Int) -> (Int, Int, Int, Int) {
    var results = [(Int, Int, Int, Int)]()

    for x in 0..<n {
        for y in 0..<n where matrix[x][y] == -1 {
            let (fav, empty) = searchAround(x, y, num)
            results.append((fav, empty, x, y))
        }
    }

    results.sort {
        ($0.0, $0.1, -$0.2, -$0.3) > ($1.0, $1.1, -$1.2, -$1.3)
    }

    return results.first!
}

func searchAround(_ x: Int, _ y: Int, _ num: Int) -> (Int, Int) {
    var fav = 0
    var empty = 0

    for (dx, dy) in dxy {
        let nx = x + dx
        let ny = y + dy

        if nx >= 0 && nx < n && ny >= 0 && ny < n {
            if matrix[nx][ny] == -1 {
                empty += 1
            }
            else if friends[num].contains(matrix[nx][ny]) {
                fav += 1
            }
        }
    }

    return (fav, empty)
}

func getScore() -> Int {
    let score = [0, 1, 10, 100, 1000]
    var sum = 0

    for x in 0..<n {
        for y in 0..<n {
            let (fav, _) = searchAround(x, y, matrix[x][y])
            sum += score[fav]
        }
    }

    return sum
}

let n = Int(readLine()!)!
var matrix = Array(repeating: Array(repeating: -1, count: n), count: n)
var friends = Array(repeating: [Int](), count: n * n)
let dxy = [(-1, 0), (0, -1), (0, 1), (1, 0)]
var nums = [Int]()

for _ in 0..<(n * n) {
    let input = readLine()!.split(separator: " ").map { Int($0)! - 1 }
    nums.append(input[0])
    for i in 1..<5 {
        friends[input[0]].append(input[i])
    }
}

for num in nums {
    let (fav, _, x, y) = findPositions(num)
    matrix[x][y] = num
}

let result = getScore()

print(result)