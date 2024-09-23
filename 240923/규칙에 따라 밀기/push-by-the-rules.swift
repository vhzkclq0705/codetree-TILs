import Foundation

func moveLeft(_ str: inout String, _ cnt: Int) {
    for _ in 0..<cnt {
        let first = str.first!
        let start = str.index(str.startIndex, offsetBy: 1)
        let end = str.endIndex
        let range = start..<end

        str = String(str[range]) + String(first)
    }
}

func moveRight(_ str: inout String, _ cnt: Int) {
    for _ in 0..<cnt {
        let last = str.last!
        let start = str.startIndex
        let end = str.index(str.endIndex, offsetBy: -1)
        let range = start..<end

        str = String(last) + String(str[range])
    }
}

var a = readLine()!
var (l, r) = (0, 0)

readLine()!.forEach {
    if $0 == "L" {
        l += 1
    }
    else {
        r += 1
    }
}

if a.count == 1 {
    print(a)
}
else {
    if l > r {
        moveLeft(&a, l - r)
    }
    else if r > l {
        moveRight(&a, r - l)
    }

    print(a)
}