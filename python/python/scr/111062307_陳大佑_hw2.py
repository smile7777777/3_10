import sys

def initialize() :
  check = False  # Flag to check if data was loaded from file
  record = []
  try:
  # Try opening 'records.txt' in read mode
    fh = open("records.txt", 'r')
    sum_str = fh.readline()  # Read the first line for the current sum of money
    
    # Check if the file is empty (no sum available)
    if sum_str == '':
      raise KeyError  # Trigger KeyError if no data
    
    sum = int(sum_str)  # Convert the sum string to an integer
    for line in fh.readlines():  # Read the remaining lines as individual records
      items = line.split()
      
      # Ensure each record has exactly two items: description and amount
      if len(items) != 2:  
          raise IndexError
      des, amt = line.split()  # Split each line into description and amount
      record.append((des, int(amt)))  # Add each record to the list
    fh.close()
    check = True  # Set check to True if loading was successful

  except FileNotFoundError:
    sys.stderr.write("")  # Silence any FileNotFoundError

  except KeyError:
    sys.stderr.write("No line is in the file.\n")  # Handle missing initial sum

  except IndexError:
    sys.stderr.write("Any of the other lines cannot be interpreted as a record\n")
    record = []  # Clear the record list on error

  except ValueError:
    sys.stderr.write("Invalid format in records.txt. Deleting the contents.\n")
    record = []  # Clear the record list if data is invalid

  finally:
    # If data not loaded from file, prompt for initial sum
    if check == False:
      try:
        sum = int(input("How much money do you have? "))
        print()
      except ValueError:
        sys.stderr.write('Invalid value for money. Set to 0 by default.\n')
        sum = 0  # Default to 0 on invalid input
  return sum, record

def add(sum, record) : 
  print("Add some expense or income records with description and amount:")
  print("desc1 amt1, desc2 amt2, desc3 amt3, ...")
  str = input().split(',')  # Split input on commas for multiple entries
  try:
    for sub_str in str:
      record.append(tuple(sub_str.split()))  # Add to records list
      if len(sub_str.split()) != 2:
        raise IndexError  # Ensure valid format        
      sum += int(sub_str.split()[1])  # Update sum with amount
  except IndexError:
    sys.stderr.write('''The format of a record should be like this: breakfast -50.
Fail to add a record.''')
    record.pop()  # Remove the incorrect entry from list

  except ValueError:
    sys.stderr.write('''Invalid value for money.
Fail to add a record.''')
    record.pop()  # Remove the incorrect entry from list
  print()
  return sum, record

def view(sum, record):
  print("Here's your expense and income records:")
  print(f"{'Description':<20} Amount")
  print("=================== ============")
  for i in record:
    print(f'{i[0]:<20} {int(i[1])}')  # Display each record
  print("=================== ============")
  print(f'Now you have {sum} dollars.\n')

def delete(sum, record):
  dele = input('Which record do you want to delete? ')
  try:
    if len(dele.split()) > 1:
      raise IndexError  # Ensure format for deletion
          
    for i in range(len(record)):
      if record[i][0] == dele:  # Find matching description
        sum -= int(record[i][1])  # Adjust sum
        record.pop(i)  # Remove record from list
        break
    else :
      raise KeyError  # Raise KeyError if no match found

  except IndexError:
    sys.stderr.write(f'''Invalid format. Fail to delete a record.\n''')
    sys.stderr.write(f'The format of a record should be like this: salary\n')

  except KeyError:
    sys.stderr.write(f'''There's no record with {dele}. Fail to delete a record\n''')
  
  return sum, record

def save(sum, record):
  with open("records.txt", 'w') as fh:  # Open file in write mode
    fh.write(f"{sum}\n")  # Save current sum to file
    record_str = [f"{des} {amt}\n" for des, amt in record]  # Prepare records
    fh.writelines(record_str)  # Write all records

  # Main user interaction loop for commands
initial_money, record = initialize()
while True:
    command = input("What do you want to do (add / view / delete / exit)? ")
    # Add new records to the list
    if command == 'add':
      initial_money, record = add(initial_money, record)
    # View existing records
    elif command == 'view':
      view(initial_money, record)
    # Delete a specific record
    elif command =='delete':
      initial_money, record = delete(initial_money, record)
    # Exit command handling
    elif command == 'exit':
      save(initial_money, record)
      break
    else:
      sys.stderr.write('Invalid command. Try again.\n')
