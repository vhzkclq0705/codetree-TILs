import Foundation

func getStr(_ str: String, _ cnt: Int) -> String {
    return String(repeating: str, count: cnt)
}

func getTriangle(_ n: Int) -> [String] {
    return (1..<n).map { getStr(" ", n - $0) + "*" + getStr(" *", $0 - 1) }
}

let n = Int(readLine()!)!
let triangle = getTriangle(n)
let mid = ["*" + getStr(" *", n - 1)]

print((triangle + mid + triangle.reversed()).joined(separator: "\n"))