import Foundation

struct Point: Hashable {
    let x: Int
    let y: Int

    init(_ x: Int, _ y: Int) {
        self.x = x
        self.y = y
    }
}

func getIntArray() -> [Int] {
    return readLine()!.split(separator: " ").map { Int($0)! }
}

func createAllPoints(_ points: [[(Int, Int)]]) -> Set<[Point]> {
    var allPoints = Set<[Point]>()

    for pointArray in points {
        var newPoints = [Point]()
        var newReversedPoints = [Point]()

        for (x, y) in pointArray {
            newPoints.append(Point(x, y))
            newReversedPoints.append(Point(y, x))
        }
        allPoints.insert(newPoints)
        allPoints.insert(newReversedPoints)
    }

    return allPoints
}

func checkPoints(_ x: Int, _ y: Int, _ pointsSet: Set<[Point]>) {
    for pointArray in pointsSet {
        var sum = 0
        var cnt = 0

        for point in pointArray {
            let nx = x + point.x
            let ny = y + point.y

            if nx >= 0 && nx < n && ny >= 0 && ny < m {
                sum += board[nx][ny]
                cnt += 1
            }
            else {
                break
            }
        }

        if cnt == 4 {
            maxNum = max(maxNum, sum)
        }
    }
}

let input = getIntArray()
let (n, m) = (input[0], input[1])
let board = (0..<n).map { _ -> [Int] in getIntArray() }
let first = [
    [(0, 0), (-1, 0), (-2, 0), (-2, 1)],
    [(0, 0), (0, 1), (0, 2), (1, 2)],
    [(0, 0), (1, 0), (2, 0), (2, -1)],
    [(0, 0), (0, -1), (0, -2), (-1, -2)]
]
let second = [
    [(0, 0), (-1, 0), (-2, 0), (-3, 0)],
    [(0, 0), (0, 1), (0, 2), (0, 3)],
]
let third = [
    [(0, 0), (-1, 0), (-1, -1), (-2, -1)],
    [(0, 0), (0, 1), (-1, 1), (-1, 2)],
    [(0, 0), (1, 0), (1, 1), (2, 1)],
    [(0, 0), (0, -1), (1, -1), (1, -2)]
]
let fourth = [
    [(0, 0), (-1, 0), (-2, 0), (-1, 1)],
    [(0, 0), (0, 1), (0, 2), (1, 1)],
    [(0, 0), (1, 0), (2, 0), (1, -1)],
    [(0, 0), (0, -1), (0, -2), (-1, -1)]
]
let fifth = [
    [(0, 0), (0, 1), (1, 0), (1, 1)]
]
var maxNum = 0

let firstPoints = createAllPoints(first)
let secondPoints = createAllPoints(second)
let thirdPoints = createAllPoints(third)
let fourthPoints = createAllPoints(fourth)
let fifthPoints = createAllPoints(fifth)

for x in 0..<n {
    for y in 0..<m {
        checkPoints(x, y, firstPoints)
        checkPoints(x, y, secondPoints)
        checkPoints(x, y, thirdPoints)
        checkPoints(x, y, fourthPoints)
        checkPoints(x, y, fifthPoints)
    }
}

print(maxNum)