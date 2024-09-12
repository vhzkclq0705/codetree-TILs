import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let ans = (input[0]...input[1]).reduce(into: 0) {
    $0 += $1 % 6 == 0 && $1 % 8 != 0 ? $1 : 0
}

print(ans)