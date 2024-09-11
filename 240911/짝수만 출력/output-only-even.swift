import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }

print((input[0]...input[1]).filter { $0 % 2 == 0 }.map { String($0) }.joined(separator: " "))