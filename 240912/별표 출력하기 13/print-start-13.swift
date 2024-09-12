import Foundation

func getStr(_ cnt: Int) -> String {
    return String(repeating: " *", count: cnt)
}

func getStars(_ n: Int) -> [String] {
    return (1...n).map { "*" + getStr($0 % 2 == 1 ? n - ($0 / 2) - 1 : $0 / 2 - 1) }
}

let n = Int(readLine()!)!
let stars = getStars(n)

print((stars + stars.reversed()).joined(separator: "\n"))