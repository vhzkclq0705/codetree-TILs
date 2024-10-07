import Foundation

let alphabets = readLine()!
var positions = [Character: [Int]]()
var cnt = 0

for (idx, char) in alphabets.enumerated() {
    positions[char, default: []].append(idx)
}

let letters = Array(positions.keys)

for i in 0..<letters.count {
    let posA = positions[letters[i]]!

    for j in i + 1..<letters.count {
        let posB = positions[letters[j]]!

        if (posA[0] < posB[0] && posB[0] < posA[1] && posA[1] < posB[1]) ||
           (posB[0] < posA[0] && posA[0] < posB[1] && posB[1] < posA[1]) {
            cnt += 1
           }
    }
}

print(cnt)