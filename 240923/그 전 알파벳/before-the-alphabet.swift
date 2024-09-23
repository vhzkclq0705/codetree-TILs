import Foundation

let ascii = Character(readLine()!).asciiValue!

print(ascii == 97 ? "z" : Character(UnicodeScalar(ascii - 1)))