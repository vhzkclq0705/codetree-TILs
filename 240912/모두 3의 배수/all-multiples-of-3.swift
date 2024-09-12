import Foundation

print(((0..<5).map { _ in Int(readLine()!)! }.allSatisfy({ $0 % 3 == 0 }) ? 1 : 0))