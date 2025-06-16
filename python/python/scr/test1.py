l = input().split()
x = float(l[0])
y = float(l[1])
k = int(l[2])

print(f'{x} * {y} equals to {x*y:.{k}f}')