import Foundation

let a = readLine()!
let b = readLine()!

print(a.components(separatedBy: b).count - 1)