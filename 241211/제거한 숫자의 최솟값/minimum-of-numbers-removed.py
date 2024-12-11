import sys
input = sys.stdin.readline

n = int(input())
nums = sorted(map(int, input().split()))
ans = 0 if not n % 2 else nums.pop()

for i in range(n // 2):
    ans = max(ans, nums[i] + nums[n - i - 1])

print(ans)