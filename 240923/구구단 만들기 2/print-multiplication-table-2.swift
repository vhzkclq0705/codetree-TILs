import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (a, b) = (input[0], input[1])

for i in stride(from: 2, through: 8, by: 2) {
    print(stride(from: b, through: a, by: -1).map { "\($0) * \(i) = \($0 * i)" }.joined(separator: " / "))
}