import csv
import random
from datetime import datetime

def create_timestamp():
    d = datetime(2016, random.randint(1, 12), random.randint(1, 28), 
            random.randint(1, 23), random.randint(1, 59), 
            random.randint(1, 59))
    return d

def get_name(list):
    max = len(list)
    index = random.randint(1, max) - 1
    return list[index]

names = ['Roger', 'Peeyush', 'Garve', 'Jon', 
         'Randy', 'Polina', 'Mike', 'Eric']

with open('logins.csv', 'wb') as csvfile:
    insert_writer = csv.writer(csvfile, delimiter=',', 
            quotechar='|', quoting=csv.QUOTE_MINIMAL)
    insert_writer.writerow(['id', 'name', 'date', 'attempted'])
    count = 1
    while count <= 50000:
        insert_writer.writerow([count, get_name(names), create_timestamp(), 1])
        count += 1
