import Foundation

func check(_ n: Int, _ restaurants: [Int], _ ldr: Int, _ mbr: Int) -> Int {
    var restaurants = restaurants
    var cnt = n

    for i in 0..<n {
        restaurants[i] -= ldr
        if restaurants[i] > 0 {
            let res = restaurants[i].quotientAndRemainder(dividingBy: mbr)
            cnt += res.quotient
            cnt += res.remainder > 0 ? 1 : 0
        }
    }

    return cnt
}

let n = Int(readLine()!)!
var restaurants = readLine()!.split(separator: " ").map { Int($0)! }
let input = readLine()!.split(separator: " ").map { Int($0)! }
let (ldr, mbr) = (input[0], input[1])

let ans = check(n, restaurants, ldr, mbr)

print(ans)