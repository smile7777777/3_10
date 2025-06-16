import sys

class Record:
    """Represent a record"""
    def __init__(self, cat, des, money):
        self._category = cat
        self._description = des
        self._amount = money
    
    @property
    def category(self):
        return self._category
    
    @property
    def description(self):
        return self._description
    
    @property
    def amount(self):
        return self._amount
    


class Categories:
  def __init__(self):
      """Initialize and return the predefined category hierarchy."""
      categories = ['expense', ['food', ['meal', 'snack', 'drink'], 'transportation', ['bus', 'railway']], 'income', ['salary', 'bonus']]
      self._category = categories

  @property
  def get_categories(self):
    return self._category

  def view(self):
      self.view_categories(self._category, 0)

  def view_categories(self, L, level):
      """Recursively display all categories with proper indentation based on their level."""
      for i in L:
          if type(i) == list:
              self.view_categories(i, level + 1)
          else:
              for k in range(level):
                  print(" ", end="")
              print(f'- {i}')

  def is_category_valid(self, category, categories):
      """Check if a category exists in the given category hierarchy."""
      valid = False
      for i in categories:
          if type(i) == list:
              valid = self.is_category_valid(category, i)
          elif i == category:
              return True
          if valid:
              return True
      return False

  def find_subcategories(self, category):
        """find all the subcategories in category and return"""
        def find_subcategories_gen(category, categories, found = False):
            """the generator of finding subcategories"""
            if type(categories) == list:
                for index, child in enumerate(categories):
                    yield from find_subcategories_gen(category, child, found)
                    if child == category and index + 1 < len(categories) and type(categories[index + 1]) == list:
                        # When the target category is found,
                        # recursively call this generator on the subcategories
                        # with the flag set as True.
                        yield from find_subcategories_gen(category, categories[index + 1], True)
            else:
                if categories == category or found == True:
                    yield categories
        record = []
        for i in find_subcategories_gen(category, self._category):
            record.append(i)
        return record

class Records:
  """Maintain a list of all the Record's and the initial amount of money"""
  def __init__(self):
      """Initialize the program with existing data from file or prompt user for initial sum."""
      check = False  # Flag to check if data was loaded from file
      record = []
      try:
          fh = open("records.txt", 'r')
          sum_str = fh.readline()  # Read the first line for the current sum of money
          if sum_str == '':
              raise KeyError  # Trigger KeyError if no data
          sum = int(sum_str)  # Convert the sum string to an integer
          for line in fh.readlines():  # Read the remaining lines as individual records
              items = line.split()
              if len(items) != 3:
                  raise IndexError
              cat, des, amt = line.split()
              record.append(Record(cat, des, int(amt)))
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
          if check == False:
              try:
                  sum = int(input("How much money do you have? "))
                  print()
              except ValueError:
                  sys.stderr.write('Invalid value for money. Set to 0 by default.\n')
                  sum = 0  # Default to 0 on invalid input
      self._record = record
      self._sum = sum
    
  def add(self, str, categories):
      """Add new expense or income records to the system."""
      try:
          for record_str in str:
              if len(record_str.split()) != 3:
                  raise IndexError  # Ensure valid format
              cat, des, amt = record_str.split()  # Add to records list
              new_record = Record(cat, des, int(amt))

              assert Categories.is_category_valid(categories, new_record._category, categories.get_categories)
              
              self._record.append(new_record)
              self._sum += new_record.amount  # Update sum with amount

      except AssertionError:
          sys.stderr.write('''The specified category is not in the category list.
  You can check the category list by command "view categories".
  Fail to add a record.
''')

      except IndexError:
          sys.stderr.write('''The format of a record should be like this: food breakfast -50.
  Fail to add a record.
''')

      except ValueError:
          sys.stderr.write('''Invalid value for money.
  Fail to add a record.
''')
      print()

  def view(self):
      """Display all current expense and income records."""
      print("Here's your expense and income records:")
      print(f"{'Categories':<20} {'Description':<20} Amount")
      print("=================== =================== ============")
      for record in self._record:
            print(f"{record.category:<20} {record.description:<20} {record.amount:>5}")  # Display each record
      print("=================== =================== ============")
      print(f'Now you have {self._sum} dollars.\n')
  
  def find(self, categories):
    """Prompt the user for a category and display all associated records."""
    category = input("Which category do you want to find? ")
    try:
        assert Categories.is_category_valid(categories, category, categories.get_categories)
    except AssertionError:
        sys.stderr.write('''The specified category is not in the category list.
You can check the category list by command "view categories".
Fail to add a record.
''')
    find_list = Categories.find_subcategories(categories, category)
    money = 0
    print(f"Here's your expense and income under category '{category}':")
    print(f"{'Categories':<20} {'Description':<20} Amount")
    print("=================== =================== ============")
    for record in self._record:
            if record.category in find_list:
                print(f'{record.category:<20} {record.description:<20} {record.amount:>5}')  # Display each record
                money += record.amount
    print("=================== =================== ============")
    print(f'The total amount above is {money}.\n')

  def delete(self, dele):
      """Delete a specific record based on its description."""
      try:
          if len(dele.split()) > 1:
              raise IndexError  # Ensure format for deletion
          for record in self._record:
              if record.description == dele:  # Find matching description
                  self._sum -= record.amount  # Adjust sum
                  self._record.remove(record)  # Remove record from list
                  break
          else:
              raise KeyError  # Raise KeyError if no match found

      except IndexError:
          sys.stderr.write(f'''Invalid format. Fail to delete a record.\n''')
          sys.stderr.write(f'The format of a record should be like this: salary\n')

      except KeyError:
          sys.stderr.write(f'''There's no record with {dele}. Fail to delete a record\n''')

  def save(self):
      """Save the current state of records and sum to a file."""
      with open("records.txt", 'w') as fh:  # Open file in write mode
          fh.write(f"{self._sum}\n")  # Save current sum to file
          for record in self._record:
                fh.write(f"{record.category} {record.description} {record.amount}\n")

# Main user interaction loop for commands

categories = Categories()
records = Records()

while True:
    command = input("What do you want to do (add / view / delete / view categories / find / exit)? ")
    if command == 'add':
        print("Add some expense or income records with category, description and amount (separate by spaces):")
        print("cat1 desc1 amt1, cat2 desc2 amt2, cat3 desc3 amt3, ...")
        record = input().split(',')  # Split input on commas for multiple entries
        records.add(record, categories)
    elif command == 'view':
        records.view()
    elif command == 'delete':
        dele = input('Which record do you want to delete? ')
        records.delete(dele)
    elif command == 'view categories':
        categories.view()
    elif command == 'find':
        records.find(categories)
    elif command == 'exit':
        records.save()
        break
    else:
        sys.stderr.write('Invalid command. Try again.\n')
