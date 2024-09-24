import Foundation

let alphabets = readLine()!
var stk = [Character]()

for alphabet in alphabets {
    if let last = stk.last {
        if last == alphabet {
            stk.removeLast()
        }
        else {
            stk.append(alphabet)
        }
    }
    else {
        stk.append(alphabet)
    }
}

print(stk.count > 0 ? stk.count / 2 - 1 : 0)