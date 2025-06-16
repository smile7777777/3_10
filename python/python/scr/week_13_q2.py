class csstr(str):
  def __lshift__(self, num):
    l = len(self)
    num %= l
    #print(l)
    #print(type(self))
    #print(self[0])
    #str1 = csstr(self[num:])
    #print(str1)
    #str2 = csstr(self[:num])
    #print(str2)
    #return l
    return csstr(self[num:] + self[:num])
  
  def __rshift__(self, num):
    l = len(self)
    num %= l
    #print(l)
    #print(type(self))
    #print(self[0])
    #str1 = csstr(self[num:])
    #print(str1)
    #str2 = csstr(self[:num])
    #print(str2)
    #return l
    return csstr(self[l-num:] + self[:l-num])

T = int(input())
for t in range(T):
    print(eval(input()))

def Pi_seq(k):
    pi_approx = 0
    k = 0
    while True:
        term = ((-1) ** k) * (4 / (2 * k + 1))
        pi_approx += term
        yield pi_approx
        k += 1
