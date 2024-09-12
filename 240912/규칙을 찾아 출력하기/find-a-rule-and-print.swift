import Foundation

func getStr(_ str: String, _ cnt: Int) -> String {
    return String(repeating: str, count: cnt)
}

func getMid(_ n: Int) -> [String] {
    return (0..<n - 2).map { "*" + getStr(" *", $0) + getStr("  ", n - 2 - $0) + " *" }
}

let n = Int(readLine()!)!

if n == 1 {
    print("*")
}
else {
    let start = ["*" + getStr(" *", n - 1)]
    let mid = getMid(n)

    print((start + mid + start).joined(separator: "\n"))
}