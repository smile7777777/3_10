T = int(input())
for i in range(T) :
  li = list(map(int, input().split()))
  ans = 0
  for j in range(len(li)):
    for k in range(j+1, len(li)):
      if li[j] > li[k]:
        ans += 1
  print(f'Case #{i+1}: {ans}')

