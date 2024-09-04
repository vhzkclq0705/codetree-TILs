import Foundation

func solution() -> Int {
    var n = Int(readLine()!)!
    var ans: Int = 0

    while n > 0 {
        if n % 5 == 0 {
            n -= 5
            ans += 1
            continue
        }

        if n % 3 == 0 {
            n -= 3
            ans += 1
            continue
        }

        return -1
    }

    return ans
}

print(solution())