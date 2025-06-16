import sys

record = []
check = False

try:
  fh = open("records.txt", 'r')
  sum_str = fh.readline()
  if sum_str == '':
    raise KeyError
  sum = int(sum_str)
  for line in fh.readlines():
    items = line.split()
    if len(items) != 2:  
        raise IndexError
    des, amt = line.split()
    record.append((des, int(amt)))
  fh.close()
  check = True
except FileNotFoundError:
  sys.stderr.write("")
except KeyError:
  sys.stderr.write("No line is in the file.\n")
except IndexError:
  sys.stderr.write("Any of the oter lines cannot be interpreted as a record\n")
  record = []
except ValueError:
  sys.stderr.write("Invalid format in records.txt. Deleting the contents.\n")
  record = []
finally:
  if check == False:
    try :
      sum = int(input("How much money do you have? "))
      print()
    except ValueError:
      print('Invalid value for money. Set to 0 by default.\n')
      sum = 0
  while True:
    try:
      mode = input("What do you want to do (add / view / delete / exit)? ")
      if mode != 'exit' and mode != 'add' and mode != 'view' and mode != 'delete':
        raise KeyError
    except KeyError:
      print('Invalid command. Try again.\n')
      continue

    if(mode == 'exit'):
      with open("records.txt", 'w') as fh:
        fh.write(f"{sum}\n")
        record_str = [f"{des} {amt}\n" for des, amt in record]
        fh.writelines(record_str)
      break

    elif(mode == 'add'):
      print("Add some expense or income records with description and amount:")
      print("desc1 amt1, desc2 amt2, desc3 amt3, ...")
      str = input().split(',')
      try:
        for sub_str in str:
          record.append(tuple(sub_str.split()))
          if len(sub_str.split()) != 2:
            raise IndexError 
          sum += int(sub_str.split()[1])
      except IndexError:
        print('''The format of a record should be like this: breakfast -50.
Fail to add a record.''')
        record.pop()
      except ValueError:
        print('''Invalid valid for money.
Fail to add a record.''')
        record.pop()
      print()

    elif(mode == 'view'):
      print("Here's your expense and income records:")
      print(f"{'Description':<20} Amount")
      print("=================== ============")
      for i in record:
        print(f'{i[0]:<20} {int(i[1])}')
      print("=================== ============")
      print(f'Now you have {sum} dollars.\n')

    elif(mode =='delete'):
      dele = input('Which record do you want to delete? ')
      try:
        if len(dele.split()) > 1:
          raise IndexError
        for i in range(len(record)):
          if record[i][0] == dele:
            sum -= int(record[i][1])
            record.pop(i)
            break
        raise KeyError
      except IndexError:
          print(f'''Invalid format. Fail to delete a record.''')
          print(f'The format of a record should be like this: salary\n')
      except KeyError:
        print(f'''There's no record with {dele}. Fail to delete a record\n''')