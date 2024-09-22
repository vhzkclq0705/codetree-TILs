import Foundation

let arr = readLine()!.split(separator: " ").map { Int($0)! }
let idx = arr.firstIndex(where: { $0 % 3 == 0 })!

print(arr[idx - 1])