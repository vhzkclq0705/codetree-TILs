struct Coordinate: Hashable {
    let x: Int
    let y: Int
}

let n = Int(readLine()!)!
let papers = (0..<n).map { _ in readLine()!.split(separator: " ").map { Int($0)! } }
var coordinates: Set<Coordinate> = Set()

for paper in papers {
    let x = paper[0]
    let y = paper[1]

    for i in x..<x + 10 {
        for j in y..<y + 10 {
            coordinates.insert(Coordinate(x: i, y: j))
        }
    }
}

print(coordinates.count)