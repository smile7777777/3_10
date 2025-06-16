sum = int(input("How much money do you have? "))
print("Add some expense or income records with description and amount:")
print("desc1 amt1, desc2 amt2, desc3 amt3, ...")
str = input().split(',')
record = []
for sub_str in str:
  record.append(tuple(sub_str.split()))
print("Here's your expense and income records:")
for i in record:
  print(f'{i[0]} {int(i[1])}')
  sum += int(i[1])
print(f'Now you have {sum} dollars.')
