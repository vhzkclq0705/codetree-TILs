import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (a, b, c) = (input[0], input[1], input[2])

print(b > a && b < c ? 1 : 0)