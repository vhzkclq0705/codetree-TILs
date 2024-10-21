import Foundation

struct Dice {
    var u: Int = 0
    var d: Int = 0
    var l: Int = 0
    var r: Int = 0
    var f: Int = 0
    var b: Int = 0

    mutating func roll(_ direction: Int) {
        switch direction {
        case 1: rollToEast()
        case 2: rollToWest()
        case 3: rollToNotrh()
        case 4: rollToSouth()
        default: break
        }

        print(u)
    }

    mutating func rollToEast() {
        let tmp = u
        u = r
        r = d
        d = l
        l = tmp
    }

    mutating func rollToWest() {
        let tmp = u
        u = l
        l = d
        d = r
        r = tmp
    }

    mutating func rollToNotrh() {
        let tmp = u
        u = b
        b = d
        d = f
        f = tmp
    }

    mutating func rollToSouth() {
        let tmp = u
        u = f
        f = d
        d = b
        b = tmp
    }

    mutating func setDiceDown(_ num: Int) {
        d = num
    }
    
    func getDiceDown() -> Int {
        return d
    }
}

func inputIntArray() -> [Int] {
    return readLine()!.split(separator: " ").map { Int($0)! }
}

let input = inputIntArray()
let (n, m, k) = (input[0], input[1], input[4])
var (x, y) = (input[2], input[3])
var board = (0..<n).map { _ -> [Int] in inputIntArray() }
let directions = inputIntArray()
var dice = Dice()
let dxy = [(0, 1), (0, -1), (-1, 0), (1, 0)]

for d in directions {
    let (dx, dy) = dxy[d - 1]
    let nx = x + dx
    let ny = y + dy

    if nx >= 0 && nx < n && ny >= 0 && ny < m {
        let num = board[nx][ny]

        dice.roll(d)

        if num == 0 {
            board[nx][ny] = dice.getDiceDown()
        } else {
            dice.setDiceDown(num)
        }

        x = nx
        y = ny
    }
}