import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }
var cnt = 0

for i in 0..<n {
    if arr[i] == 2 {
        cnt += 1
    }

    if cnt == 3 {
        print(i + 1)
        break
    }
}