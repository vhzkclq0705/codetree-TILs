import Foundation

for i in 1...Int(readLine()!)! {
    if !((i % 2 == 0 && i % 4 != 0) || (i / 8 % 2 == 0) || (i % 7 < 4)) {
        print(i, terminator: " ")
    }
}