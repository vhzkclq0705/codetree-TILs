import Foundation

for _ in 0..<Int(readLine()!)! {
    let num = Int(readLine()!)!
    if num % 3 == 0 && num % 2 == 1 {
        print(num)
    }
}