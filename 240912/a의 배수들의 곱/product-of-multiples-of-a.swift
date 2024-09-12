import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let ans = (1...input[1]).reduce(into: 1) {
    $0 *= $1 % input[0] == 0 ? $1 : 1
}

print(ans)