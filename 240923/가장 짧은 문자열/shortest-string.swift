import Foundation

let s1 = readLine()!.count
let s2 = readLine()!.count
let s3 = readLine()!.count

print(max(s1, s2, s3) - min(s1, s2, s3))