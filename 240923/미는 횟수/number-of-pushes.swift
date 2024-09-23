import Foundation

func validate(_ a: inout String, _ b: String) -> Int {
    var cnt = 0

    while a != b {
        if cnt == a.count {
            return -1
        }

        let last = String(a.last!)
        a.removeLast()
        a = last + a
        cnt += 1
    }

    return cnt
}

var a = readLine()!
let b = readLine()!

print(validate(&a, b))