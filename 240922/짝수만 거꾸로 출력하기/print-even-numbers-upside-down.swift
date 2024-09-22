import Foundation

let n = Int(readLine()!)!
print(readLine()!.split(separator: " ").map { String($0) }.reversed().filter { Int($0)! % 2 == 0 }.joined(separator: " "))