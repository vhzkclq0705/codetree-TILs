import Foundation

print(Array(readLine()!).enumerated().filter { $0.0 % 2 == 1 }.map { String($0.1) }.reversed().joined())