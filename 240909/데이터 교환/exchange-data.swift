var (a, b, c) = (5, 6, 7)
let tmp = a
a = c
c = b
b = tmp

print(a)
print(b)
print(c)