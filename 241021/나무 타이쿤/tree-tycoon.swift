import Foundation

func moveTonics(_ d: Int, _ p: Int) {
    let dxy = [(0, 1), (-1, 1), (-1, 0), (-1, -1), (0, -1), (1, -1), (1, 0), (1, 1)]
    var movedTonics = [(Int, Int)]()
    let (dx, dy) = dxy[d]

    while tonics.count > 0 {
        let (x, y) = tonics.removeLast()
        var nx = (x + dx * p)
        var ny = (y + dy * p)

        nx = nx < 0 ? n + nx : nx % n
        ny = ny < 0 ? n + ny : ny % n
        
        movedTonics.append((nx, ny))
    }

    tonics = movedTonics
}

func growTrees() {
    for (x, y) in tonics {
        trees[x][y] += 1
    }

    for (x, y) in tonics {
        let cnt = checkDiag(x, y)
        trees[x][y] += cnt
    }
}

func cutTrees() {
    var newTonics = [(Int, Int)]()

    for x in 0..<n {
        for y in 0..<n where trees[x][y] >= 2 && !tonics.contains(where: { $0 == (x, y) }) {
            newTonics.append((x, y))
            trees[x][y] -= 2
        }
    }

    tonics = newTonics
}

func getHeights() -> Int {
    var cnt = 0

    for x in 0..<n {
        for y in 0..<n {
            cnt += trees[x][y]
        }
    }

    return cnt
}

func checkDiag(_ x: Int, _ y: Int) -> Int {
    let dxy = [(-1, -1), (-1, 1), (1, -1), (1, 1)]
    var cnt = 0

    for (dx, dy) in dxy {
        let nx = x + dx
        let ny = y + dy

        if nx >= 0 && nx < n && ny >= 0 && ny < n && trees[nx][ny] >= 1 {
            cnt += 1
        }
    }

    return cnt
}

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (input[0], input[1])
var trees = (0..<n).map { _ -> [Int] in readLine()!.split(separator: " ").map { Int($0)! } }
var tonics = [(Int, Int)]()


for x in (n - 2)..<n {
    for y in 0..<2 {
        tonics.append((x, y))
    }
}

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (d, p) = (input[0] - 1, input[1])
    
    moveTonics(d, p)
    growTrees()
    cutTrees()
}

let result = getHeights()

print(result)