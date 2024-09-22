import Foundation

print(readLine()!.split(separator: " ").map { Int($0)! }.firstIndex(where: { $0 % 3 == 0 })!)