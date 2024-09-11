import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (a, n) = (input[0], input[1])

for i in stride(from: a + n, through: a + n * n, by: n) {
    print(i)
}