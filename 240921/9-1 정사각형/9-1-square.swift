import Foundation

let n = Int(readLine()!)!
var i = 9

for _ in 0..<n {
    var tmp = ""

    for _ in 0..<n {
        tmp += String(i)
        i -= 1

        if i == 0 {
            i = 9
        }
    }

    print(tmp)
}