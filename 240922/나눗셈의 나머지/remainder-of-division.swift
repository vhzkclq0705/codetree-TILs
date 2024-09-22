import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
var a = input[0]
let b = input[1]
var dict = [Int: Int]()

while a > 1 {
    let res = a.quotientAndRemainder(dividingBy: b)
    dict[res.1, default: 0] += 1

    a = res.0
}

print(dict.reduce(into: 0) { $0 += $1.value * $1.value })