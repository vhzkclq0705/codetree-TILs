import Foundation

func checkLeaders(_ n: Int, _ restaurants: inout [Int], _ ldr: Int) {
    for i in 0..<n {
        restaurants[i] -= ldr
    }
}

func checkMembers(_ n: Int, _ restaurants: [Int], _ mbr: Int) -> Int {
    var cnt = 0

    for i in 0..<n where restaurants[i] > 0 {
        let res = restaurants[i].quotientAndRemainder(dividingBy: mbr)
        cnt += res.quotient
        cnt += res.remainder > 0 ? 1 : 0
    }

    return cnt
}

let n = Int(readLine()!)!
var restaurants = readLine()!.split(separator: " ").map { Int($0)! }
let input = readLine()!.split(separator: " ").map { Int($0)! }
let (ldr, mbr) = (input[0], input[1])
var ans = n

checkLeaders(n, &restaurants, ldr)
ans += checkMembers(n, restaurants, mbr)

print(ans)