x = int(input())
arr = []
for i in range(x):
    arr.append(int(input()))
    #num = int(input())
    sig_ = arr[i] // 128
    remain = arr[i] % 128
    arr[i] = (remain << 1) + sig_
    print("Case #%d: %d" % (i+1, arr[i]))
