money = input('How much money do you have? ')
express = input('Add an expense or income record with description and amount:\n')
cost = express.split()
print('Now you have %d dollars.' % (int(money) + int(cost[1])))
