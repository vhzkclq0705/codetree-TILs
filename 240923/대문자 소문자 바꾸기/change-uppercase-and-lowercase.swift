import Foundation

print(readLine()!.map { $0.isUppercase ? $0.lowercased() : $0.uppercased() }.joined())