import Foundation

let n = Int(readLine()!)!
var cnt = 0

for i in 1...n {
    var tmp = [String]()

    for _ in 0..<n {
        cnt += i % 2 == 1 ? 1 : 2
        tmp.append(String(cnt))
    }

    print(tmp.joined(separator: " "))
}