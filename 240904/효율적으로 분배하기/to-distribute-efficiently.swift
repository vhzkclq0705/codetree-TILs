func solution() -> Int {
    let n = Int(readLine()!)!
    var cnt5 = n / 5
    var remainder = n % 5

    while cnt5 >= 0 {
        if remainder % 3 == 0 {
            let cnt3 = remainder / 3
            return cnt3 + cnt5
        }

        cnt5 -= 1
        remainder += 5
    }

    return -1
}

print(solution())