import Foundation

func createSquares(_ n: Int) -> [String] {
    return Array(repeating: String(repeating: "*", count: n), count: n)
}

func displaySquares(_ sqaure: [String]) {
    print(sqaure.joined(separator: "\n"))
}

let n = Int(readLine()!)!
let sqaure = createSquares(n)

displaySquares(sqaure)
print()
displaySquares(sqaure)