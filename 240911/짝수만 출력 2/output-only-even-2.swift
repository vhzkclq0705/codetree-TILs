import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }

print((input[1]...input[0]).filter { $0 % 2 == 0 }.map { String($0) }.reversed().joined(separator: " "))