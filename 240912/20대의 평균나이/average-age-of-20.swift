import Foundation

var ages = [Int]()

while true {
    let age = Int(readLine()!)!

    if age < 20 || age >= 30 {
        print(String(format: "%.2f", (Double(ages.reduce(0, +)) / Double(ages.count))))
        break
    }
    ages.append(age)
}