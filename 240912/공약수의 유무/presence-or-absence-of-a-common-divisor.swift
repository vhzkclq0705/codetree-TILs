import Foundation

func gcd(_ a: Int, _ b: Int) -> Int {
    return b == 0 ? a : gcd(b, a % b)
}

func calculate(_ n: Int) -> Bool {
    return divisors.contains(n)
}

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (a, b) = (input[0], input[1])
let n = gcd(1920, 2880)
let divisors = (1...Int(sqrt(Double(n)))).reduce(into: Set<Int>()) {
        if n % $1 == 0 {
            $0.insert($1)
            $0.insert(n / $1)
        }
    }

print((a...b).allSatisfy({ !calculate($0) }) ? 0 : 1)