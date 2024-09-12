import Foundation

func returnStr(_ char: Character, _ cnt: Int) -> String {
    return String(repeating: char, count: cnt)
}

let n = Int(readLine()!)!
let ans = (0..<n).map {
    let stars = returnStr("*", n - $0)
    return stars + returnStr(" ", $0 * 2) + stars
    }

print(ans.joined(separator: "\n"))