let input = readLine()!.split(separator: " ").map { Int($0)! }
let (a, b, c) = (input[0] ,input[1], input[2])
let sum = a + b + c
let avg = sum / 3

print(sum)
print(avg)
print(sum - avg)