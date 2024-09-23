import Foundation

let n = Int(readLine()!)!
var sum = String((0..<n).reduce(into: 0) { total, _ in
    total += Int(readLine()!)!
})
let first = String(sum.first!)
sum.removeFirst()

print(sum + first)