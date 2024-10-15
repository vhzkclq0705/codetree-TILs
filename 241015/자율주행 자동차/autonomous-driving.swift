import Foundation

func input() -> [Int] {
    return readLine()!.split(separator: " ").map { Int($0)! }
}

func move() -> Bool {
    for _ in 0..<4 {
        d = (d + 3) % 4
        let (dx, dy) = dxy[d]
        let nx = x + dx
        let ny = y + dy

        if nx >= 0 && nx < n && ny >= 0 && ny < m && road[nx][ny] == 0 {
            x = nx
            y = ny
            road[nx][ny] = -1

            return true
        }
    }

    return false
}

func moveBack() -> Bool {
    let (dx, dy) = dxy[(d + 2) % 4]
    let nx = x + dx
    let ny = y + dy

    if nx < 0 || nx >= n || ny < 0 || ny >= m || road[nx][ny] == 1 {
        return false
    }

    x += dx
    y += dy

    return true
}

func checkRoad() -> Int {
    var cnt = 0

    for i in 0..<n {
        for j in 0..<m where road[i][j] == -1 {
            cnt += 1
        }
    }

    return cnt
}

func display() {
    for i in road {
        print(i)
    }
}

let input1 = input()
let input2 = input()
let (n, m) = (input1[0], input1[1])
var (x, y, d) = (input2[0], input2[1], input2[2])
var road = (0..<n).map { _ -> [Int] in input() }
let dxy = [(-1, 0), (0, 1), (1, 0), (0, -1)]
road[x][y] = -1

while true {
    if move() {
        continue
    }
    if !moveBack() {
        break
    }
}

print(checkRoad())