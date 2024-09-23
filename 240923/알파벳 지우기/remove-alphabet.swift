import Foundation

let a = Int(readLine()!.filter { $0.isNumber })!
let b = Int(readLine()!.filter { $0.isNumber })!

print(a + b)