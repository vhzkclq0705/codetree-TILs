import Foundation

let n = Int(readLine()!)!

for i in 1...n {
    print((1...n).map { String($0 * i) }.reversed().joined(separator: " "))
}