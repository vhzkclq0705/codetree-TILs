import sys
input = sys.stdin.readline

n = int(input())
nums = sorted(map(int, input().split()))
ans = sys.maxsize if not n % 2 else nums[n // 2]

for i in range(n // 2):
    ans = min(ans, nums[i] + nums[n - i - 1])

print(ans)