import Foundation

let inputA = readLine()!.split(separator: " ")
let inputB = readLine()!.split(separator: " ")

print((Int(inputA[0])! >= 19 && inputA[1] == "M") || (Int(inputB[0])! >= 19 && inputB[1] == "M") ? 1 : "")