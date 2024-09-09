import Foundation

func solution() {
    var n = Int(readLine()!)!
    var ans = [n]

    while n >= 3 {
        ans.append(n / 3)
        n /= 3
    } 

    print(ans.reversed().map { String($0) }.joined(separator: " "))
}

solution()