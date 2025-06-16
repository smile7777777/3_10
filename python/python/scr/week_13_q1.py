class Player:
    def __init__(self):
        #your code here
        self.value = 0
        self.pol = -1
    def add(self, val):
        #your code here
        self.value += val
    def getval(self):
        #your code here
        return self.value
    def getpoly(self):
        #your code here
        self.pol += 1
        return self.pol        

n = int(input())
p1 = Player()
p2 = Player()
for i in range(n):
    player, value = input().split()
    if int(player) == 1:
        #your code here
        val = int(value) ** int(p1.getpoly())
        p1.add(val)
    else:
        #your code here
        val = int(value) ** int(p2.getpoly())
        p2.add(val)

#choose the winner
if int(p1.getval()) > int(p2.getval()) :
  winner = 1
elif int(p1.getval()) < int(p2.getval()) :
  winner = 2
elif int(p1.pol) > int(p2.pol):
  winner = 1
elif int(p1.pol) < int(p2.pol):
  winner = 2
else:
   winner = 'DRAW'

print(winner)