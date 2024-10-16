import Foundation

struct Point {
    let x: Int
    let y: Int
}

func getDistance(_ a: Point, _ b: Point) -> Int {
    return abs(a.x - b.x) + abs(a.y - b.y)
}

func getHospitalCombs() -> [[Point]] {
    var hospitalCombs = [[Point]]()

    func dfs(_ idx: Int, _ comb: [Point]) {
        if comb.count == m {
            hospitalCombs.append(comb)
            return
        }

        if idx == hospitals.count {
            return
        }

        dfs(idx + 1, comb + [hospitals[idx]])
        dfs(idx + 1, comb)
    }

    dfs(0, [])

    return hospitalCombs
}

func calculateDistance(_ hospitalComb: [Point]) -> Int {
    var totalDis = 0

    for person in people {
        var minDis = Int.max
        for hospital in hospitalComb {
            let dis = getDistance(person, hospital)
            minDis = min(minDis, dis) 
        }
        totalDis += minDis
    }

    return totalDis
}

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (input[0], input[1])
let matrix = (0..<n).map { _ -> [Int] in readLine()!.split(separator: " ").map { Int($0)! } }
var people = [Point]()
var hospitals = [Point]()
var minValue = Int.max

for x in 0..<n {
    for y in 0..<n {
        if matrix[x][y] == 1 {
            people.append(Point(x: x, y: y))
        }
        else if matrix[x][y] == 2 {
            hospitals.append(Point(x: x, y: y))
        }
    }
}

let hospitalCombs = getHospitalCombs()
for hospitalComb in hospitalCombs {
    let totalDis = calculateDistance(hospitalComb)
    minValue = min(minValue, totalDis)
}

print(minValue)