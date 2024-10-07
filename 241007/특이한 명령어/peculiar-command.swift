import Foundation

let n = Int(readLine()!)!

for _ in 0..<n {
    let input = readLine()!.split(separator: " ")
    let (a, b, c) = (Int(input[0])!, Int(input[1])!, input[2])

    if c == "s" {
        print(a * b)
    }
    else if c == "t" {
        print(String(format: "%.1f", Double(a * b) / 2.0))
    }
}