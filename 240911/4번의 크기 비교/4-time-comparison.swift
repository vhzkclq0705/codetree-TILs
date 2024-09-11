import Foundation

let a = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map { Int($0)! }
let (b, c, d, e) = (input[0], input[1], input[2], input[3])

print(a > b ? 1 : 0)
print(a > c ? 1 : 0)
print(a > d ? 1 : 0)
print(a > e ? 1 : 0)