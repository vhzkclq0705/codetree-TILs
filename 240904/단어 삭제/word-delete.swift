import Foundation

func solution() -> String {
    var a = readLine()!
    let b = readLine()!
    
    while true {
        let tmp = a

        a = a.replacingOccurrences(of: b, with: "")
        if tmp == a {
            return a
        }
    }
}

print(solution())