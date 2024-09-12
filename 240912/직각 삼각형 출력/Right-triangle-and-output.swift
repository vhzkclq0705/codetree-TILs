import Foundation

let n = Int(readLine()!)!

for i in stride(from: 1, through: 2 * n - 1, by: 2) {
    print(String(repeating: "*", count: i))
}