import math
n = int(input())
m = int(math.sqrt(2 * n)) + 1
F = [[0 for j in range(m + 1)] for i in range(n + 1)]

F[0][0] = 1
for i in range(1, n + 1):
    for j in range(1, m + 1):
        if j * (j + 1) <= 2 * i:
            F[i][j] = F[i - j][j - 1] + F[i - j][j]
        else:
            break
Res = 0
for i in range(2, m + 1):
    Res += F[n][i]
print(Res)