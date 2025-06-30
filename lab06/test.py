from lab06 import *
a = BankAccount('Eric')
a.deposit(100)
print(a.transactions)
b = BankAccount('Erica')
a.withdraw(30)    # Transaction 1 for a
print(a.transactions)
a.deposit(10)     # Transaction 2 for a
print(a.transactions)
b.deposit(50)
print(b.transactions)
print(a.transactions)
b.withdraw(10)    # Transaction 1 for b

a.withdraw(100)
print(len(a.transactions))
print(a.transactions)
print(b.transactions)