import sys

class Record:
    """Represent a record."""
    def __init__(self, a, b, c):
        """create a instance"""
        self._category = a
        self._description = b
        self._cost = c

    @property
    def category(self):
        """return the category."""
        return self._category

    @property
    def description(self):
        """return the description."""
        return self._description

    @property
    def amount(self):
        """return the amount."""
        return self._cost

class Records:
    """Maintain a list of all the 'Record's and the initial amount of money."""
    def __init__(self, categories):
        """create a instance and check out the previous records"""
        fh = open("pymoney.txt", "a+")
        fh.seek(0)
        file = fh.readlines()
        fh.close()
        data = "pymoney.txt"
        self._records = []
        if (file == []):
            try:
                self._initial_money = int(input("How much money do you have?  "))
                self._records = []
            except ValueError: # amount not int
                sys.stderr.write("Invalid value for money. Set to 0 by default.\n")
                self._initial_money = 0
                self._records = []
        else:
            try:
                self._initial_money = int(file[0])
                all = file[1].split(', ')
                self.deal_the_data(all, categories)
                self._records = Records.extention(all)
                print("Welcome back!")
            except (ValueError, IndexError, AssertionError): # clear data if there's something wrong
                sys.stderr.write("Invalid format in records.txt. Deleting the contents.\n")
                fh1 = open(data, "w")
                fh1.close()
                try:
                    self._initial_money = int(input("How much money do you have?  "))
                    self._records = []
                except ValueError: # amount not int
                    sys.stderr.write("Invalid value for money. Set to 0 by default.\n")
                    self._initial_money = 0
                    self._records = []

    @staticmethod
    def deal_the_data(L, categories):
        """check whether the initial data or the input data is correct"""
        for i in L:
            if not (i.count(' ') == 2):
                raise AssertionError('The format of a record should be like this: [category] [description] [amount].\nFail to add a record.\n')
            a, b, c = i.split(' ')
            if not (Categories.is_category_valid(categories, a, categories._categories)):
                raise AssertionError('The specified category is not in the category list.')

    @staticmethod
    def extention(records):
        """input the initial records to list"""
        x = []
        for i in records:
            a = i.split()
            x.extend([Record(a[0], a[1], int(a[2]))])
        return x

    def add(self, L, categories):
        """add function, add the new Record to the Records, format: [category1] [description1] [amount1], [category2] [description2] [amount2],..."""
        all = L.split(', ')
        try:
            Records.deal_the_data(all, categories)
            for i in all:
                a = i.split(' ')
                self._records.extend([Record(a[0], a[1], int(a[2]))])
        except (ValueError): # money amount wrong
            sys.stderr.write("Invalid value for money.\nFail to add a record.\n")
        except (IndexError, AssertionError) as error: # format wrong
            if error.args == ('The specified category is not in the category list.',):
                sys.stderr.write('The specified category is not in the category list.\nYou can check the category list by command "view categories".\nFail to add a record.\n')
            else:
                sys.stderr.write("The format of a record should be like this: meal breakfast -50.\nFail to add a record.\n")

    def view(self):
        """view function, order all the Record in Records and print them"""
        self._records = Records.view_print(self._records, self._initial_money)

    def delete(self, num):
        """delete function, delete the [i]th Record in the Records, if there's no [i]th Record, do nothing"""
        try:
            # length = len(records)
            de = self._records.pop(num-1)
            print(f'[{de.category} {de.description} {de.amount}] was deleted.')
        except IndexError:
            sys.stderr.write(f"There's no record with the {num}th data. Fail to delete a record.\n")
        except ValueError:
            sys.stderr.write("Invalid format. Fail to delete a record.\n")

    def find(self, records_want, target, categories):
        """find function, find all the specific category Record in the Records and print them"""
        if not Categories.is_category_valid(categories, target, categories._categories):
            print("There's no this kind of category in categories\nTry again")
            return
        records_total = list(filter(lambda x: x.category in records_want, self._records))
        self.print_find(records_total, target)

    @staticmethod
    def print_find(L, category):
        """print the result from the find function"""
        income = 0
        expenditure = 0
        print(f"\nHere's your {category}'s expense and income records:")
        print(f'Description{' ' * 9}Category{' ' * 13}Amount')
        print('===============================================')
        print(f'{'*' * ((46 - len(category))//2)}{category}{'*'* ((47 - len(category))//2)}\n')
        if(L == []):
            print(f'{' ' * 19}--Empty--{' ' * 19}\n')
        else:
            for i, j in enumerate(L):
                print(f'{i+1}. {j.description}{' '* (44 - len(j.description) - len(str(j.amount)))}{j.amount}\n')
                if(j.amount > 0):
                    income += j.amount
                elif(j.amount < 0):
                    expenditure -= j.amount
        print("===============================================\n")
        print(f"Total income: {income}{' ' * (18 - len(str(income)) - len(str(expenditure)))}Total expense: {expenditure}")
        print(f"Total amount: {income-expenditure}")

    def save(self):
        """save all the Record into a text file"""
        fh = open("pymoney.txt", "w")
        fh.write(str(self._initial_money) + "\n")
        for i, j in enumerate(self._records):
            if(i != 0):
                fh.write(', ')
            fh.write(f"{j.category} {j.description} {j.amount}")
        fh.close()

    @staticmethod
    def view_print(records, money):
        """order all the Record in the records and print them, and return the ordered Records"""
        now = money
        income = 0
        expenditure = 0
        D = {'expense': -1, 'food': 0, 'meal' : 1, 'snack': 2, 'drink' : 3, 'transportation': 4, 'bus': 5, 'railway': 6, 'income': 7, 'salary': 8, 'bonus': 9}
        order_record = sorted(records, key = lambda x: (D.get(x.category, 10), x.amount))
        print(f"\n{' ' * 4}Here's your expense and income records:")
        print(f'Description{' ' * 9}Category{' ' * 13}Amount')
        print('===============================================\n')
        cate_now = 'error'
        if(order_record == []):
            print(f'{' ' * 19}--Empty--{' ' * 19}\n')
        else:
            for i, j in enumerate(order_record):
                if(cate_now != j.category):
                    print(f'{'*' * ((46 - len(j.category))//2)}{j.category}{'*'* ((47 - len(j.category))//2)}\n')
                    cate_now = j.category
                print(f'{i+1}. {j.description}{' '* (44 - len(j.description) - len(str(j.amount)))}{j.amount}\n')
                now = now + j.amount
                if(j.amount > 0):
                    income += j.amount
                elif(j.amount < 0):
                    expenditure -= j.amount
        print("===============================================\n")
        print(f"You have {money} dollars at first.")
        print(f"Total income: {income}{' ' * (18 - len(str(income)) - len(str(expenditure)))}Total expense: {expenditure}")
        print(f"Now you have {now} dollars.")
        if(now < 0):
            print("Do you forget your income? It's negative!\n")
        return order_record

class Categories:
    def __init__(self):
        """set all the categories list"""
        self._categories = ['expense', ['food', ['meal', 'snack', 'drink'], 'transportation', ['bus', 'railway']], 'income', ['salary', 'bonus']]

    def view(self, L, level):
        """view all the category list"""
        for i in L:
            if type(i) is list:
                self.view(i, level+1)
            else:
                print(f'{' ' * level * 4}-{i}')

    def is_category_valid(self, target, categories):
        """check whether the target is in the categories if yes, return True, and if no, return False"""
        for i in categories:
            if type(i) is list:
                if self.is_category_valid(target, i) == True:
                    return True
                else:
                    continue
            else:
                if target == i:
                    return True
                else:
                    continue
        return False

    def find_subcategories(self, category):
        """find all the subcategories in category and return"""
        def find_subcategories_gen(category, categories, found = False):
            """the generator of finding subcategories"""
            if type(categories) == list:
                for i, j in enumerate(categories):
                    yield from find_subcategories_gen(category, j, found)
                    if j == category and i + 1 < len(categories) and type(categories[i+1]) == list:
                        # When the target category is found,
                        # recursively call this generator on the subcategories
                        # with the flag set as True.
                        yield from find_subcategories_gen(category, categories[i+1], True)
            else:
                if categories == category or found == True:
                    yield categories
        result = []
        for i in find_subcategories_gen(category, self._categories):
            result.append(i)
        return result


categories = Categories()
records = Records(categories)

while True:
    command = input('\nWhat do you want to do (add / view / delete / view categories / find / exit)? ')
    if command == 'add':
        record = input('Add some expense or income records with category, description, and amount (separate by spaces):\ncat1 desc1 amt1, cat2 desc2 amt2, cat3 desc3 amt3, ...\n')
        records.add(record, categories)
    elif command == 'view':
        records.view()
    elif command == 'delete':
        delete_record = int(input("Which record do you want to delete? "))
        records.delete(delete_record)
    elif command == 'view categories':
        categories.view(categories._categories, 0)
    elif command == 'find':
        category = input('Which category do you want to find? ')
        target_categories = categories.find_subcategories(category)
        records.find(target_categories, category, categories)
    elif command == 'exit':
        records.save()
        break
    else:
        sys.stderr.write('Invalid command. Try again.\n')
