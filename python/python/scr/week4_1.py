x = int(input())
for i in range(x):
    str = input()
    st = str.split()
    print("Case #%d: %d" % (i+1 , (st[0].find(st[1]))))
