import Foundation

let inputA = readLine()!.split(separator: " ")
let inputB = readLine()!.split(separator: " ")

if (Int(inputA[0])! >= 19 && inputA[1] == "M") || (Int(inputB[0])! >= 19 && inputB[1] == "M") {
    print(1)
}