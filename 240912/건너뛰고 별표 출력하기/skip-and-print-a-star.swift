import Foundation

let n = Int(readLine()!)!
let stars = (1..<n).map { String(repeating: "*", count: $0) }

print((stars + [String(repeating: "*", count: n)] + stars.reversed()).joined(separator: "\n\n"))