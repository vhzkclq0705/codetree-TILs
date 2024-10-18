import Foundation

func input() -> [Int] {
    return readLine()!.split(separator: " ").map { Int($0)! }
}

func rotate() {
    let tmpUp = up[n - 1]
    let tmpDown = down[0]

    for i in stride(from: n - 1, to: 0, by: -1) {
        up[i] = up[i - 1]
        people[i] = people[i - 1]
    }
    for i in 0..<(n - 1) {
        down[i] = down[i + 1]
    }

    up[0] = tmpDown
    down[n - 1] = tmpUp
    people[0] = false
    people[n - 1] = false
}

func movePeople() {
    for i in stride(from: n - 1, to: 0, by: -1) where !people[i] && up[i] > 0 && people[i - 1]  {
        people[i] = people[i - 1]
        people[i - 1] = false
        up[i] -= 1

        if up[i] == 0 {
            cnt += 1
        }
    }

    people[n - 1] = false
}

func addPerson() {
    if !people[0] && up[0] > 0 {
        people[0] = true
        up[0] -= 1

        if up[0] == 0 {
            cnt += 1
        }
    }
}

let input1 = input()
let (n, k) = (input1[0], input1[1])
let input2 = input()
var (up, down) = (Array(input2[0..<n]), Array(input2[n..<(2 * n)].reversed()))
var people = Array(repeating: false, count: n)
var cnt = 0
var ans = 0

while true {
    ans += 1

    rotate()
    movePeople()
    addPerson()

    if cnt >= k {
        break
    }
}

print(ans)