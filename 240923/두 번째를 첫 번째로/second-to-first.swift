import Foundation

let s = readLine()!
let second = s[s.index(after: s.startIndex)]

print(String(s.map { $0 == second ? s.first! : $0 }))