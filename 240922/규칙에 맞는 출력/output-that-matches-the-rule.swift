import Foundation

let n = Int(readLine()!)!

for i in stride(from: n, through: 1, by: -1) {
    print((i...n).map { String($0) }.joined(separator: " "))
}