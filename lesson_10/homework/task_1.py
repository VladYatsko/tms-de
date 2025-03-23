data_2023_01 = [
    "2023-01-01:1000:Иван Иванов",
    "2023-01-02:1500:Петр Петров",
    "2023-01-03:2000:Мария Сидорова"
]

data_2023_02 = [
    "2023-02-01:1200:Иван Иванов",
    "2023-02-02:1800:Петр Петров",
    "2023-02-03:2200:Мария Сидорова"
]

data_2023_03 = [
    "2023-03-01:1300:Иван Иванов",
    "2023-03-02:1700:Петр Петров",
    "2023-03-03:2100:Мария Сидорова"
]

data_dict = {
    ".\\task_2_files\\sales_2023_01.txt": data_2023_01,
    ".\\task_2_files\\sales_2023_02.txt": data_2023_02,
    ".\\task_2_files\\sales_2023_03.txt": data_2023_03
}


for filename, data in data_dict.items():
    with open(filename, "w", encoding="utf-8") as file:
        file.write("\n".join(data))


sales_summary = {}
total_sales = 0

for filename in data_dict:
    with open(filename, "r", encoding="utf-8") as file:
        for line in file:
            date, amount, manager = line.strip().split(":")
            amount = int(amount)
            total_sales += amount
            sales_summary[manager] = sales_summary.get(manager, 0) + amount


best_manager = max(sales_summary, key=sales_summary.get)


with open(".\\task_2_files\\report.txt", "w", encoding="utf-8") as report_file:
    report_file.write(f"Total sales: {total_sales}\n")
    report_file.write(f"Best manager: {best_manager}")
