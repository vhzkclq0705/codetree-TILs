import Foundation

print((0..<5).map { _ in Int(readLine()!)! }.filter { $0 % 2 == 0 }.count)