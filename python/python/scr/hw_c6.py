sum = int(input("How much money do you have? "))
record = []
while True:
  mode = input("What do you want to do (add / view / delete / exit)? ")

  if(mode == 'exit'):
    break
  elif(mode == 'add'):
    print("Add some expense or income records with description and amount:")
    print("desc1 amt1, desc2 amt2, desc3 amt3, ...")
    str = input().split(',')
    for sub_str in str:
      record.append(tuple(sub_str.split()))
      sum += int(sub_str.split()[1])
  elif(mode == 'view'):
    print("Here's your expense and income records:")
    print(f"{'Description':<20} Amount")
    print("=================== ============")
    for i in record:
      print(f'{i[0]:<20} {int(i[1])}')
    print("=================== ============")
    print(f'Now you have {sum} dollars.')
  elif(mode =='delete'):
    dele = input('Which record do you want to delete? ')
    for i in range(len(record)):
      if record[i][0] == dele:
        sum -= int(record[i][1])
        record.pop(i)
        break