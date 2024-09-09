import Foundation

let input = readLine()!.split(separator: " ").map { Double($0)! }
let (a, b) = (input[0], input[1])

print(String(format: "%.2f", (a + b) / (a - b)))