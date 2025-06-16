class Rectangle:
    def __init__(self, w, h):
        self.w = w
        self.h = h

    @property
    def area(self):
        return self.w * self.h

    def __gt__(self, other):
        # your code here
        if self.area > other.area and max(self.w, self.h) >= max(other.w, other.h) and (min(self.w, self.h) >= min(other.w, other.h)):
            return True
        return False
          #return True

    def __lt__(self, other):
        # your code here
        if self.area < other.area and max(self.w, self.h) <= max(other.w, other.h) and (min(self.w, self.h) <= min(other.w, other.h)):
          return True
        return False
           
        #super.__lt__(self.area, other.area)

    def __eq__(self, other):
        # your code here
        if self.area == other.area and max(self.w, self.h) == max(other.w, other.h) and (min(self.w, self.h) == min(other.w, other.h)):
          return True
        return False
          
        #super.__eq__(self.area, other.area)

T = int(input())
for t in range(T):
    s = input()
    print(eval(s))