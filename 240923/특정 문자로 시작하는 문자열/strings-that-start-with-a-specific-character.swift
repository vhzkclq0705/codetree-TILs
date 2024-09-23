import Foundation

let n = Int(readLine()!)!
let arr = (0..<n).map { _ in readLine()! }
let alphabet = Character(readLine()!)
let ans = arr.filter { $0.first! == alphabet }
let cnt = ans.count
let sum = ans.reduce(into: Double(0)) {
    $0 += Double($1.count)
}

print(cnt, String(format: "%.2f", sum / Double(cnt)))