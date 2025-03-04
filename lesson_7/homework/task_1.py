import sys


user_input = sys.argv[1]
normalized_array = user_input.split(',')
numbers_array = [int(num) for num in normalized_array]

for num in numbers_array:
    if num < 10:
        print(f'{num} - Small')
    elif 10 <= num < 50:
        print(f'{num} - Medium')
    else:
        print(f'{num} - Large')
