import Foundation

let n = Int(readLine()!)!

for i in stride(from: n, to: 0, by: -1) {
    print((1...i).map { "\(n + 1 - i) * \($0) = \((n + 1 - i) * $0)" }.joined(separator: " / "))
}