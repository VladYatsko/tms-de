def create_file() -> None:
    """
    Current function creates a new file.
    :return: Creates file
    """
    return open('statistics.txt', 'x').close()


def write_file():
    """
    Current function writes a new file.
    :return: None
    """
    with (open('.\\filename.txt', 'r', encoding='utf-8') as source_file,
          open('statistics.txt', 'a', encoding='utf-8') as statistics_file):
        lines = source_file.readlines()

        jobs = []
        cities = []
        countries = []

        for line in lines:
            data = line.strip().split(',')[5:]
            jobs.append(data[0])
            cities.append(data[1])
            countries.append(data[2])

        unique_jobs = set(jobs)
        unique_countries = set(countries)
        unique_cities = set(cities)

        for job in unique_jobs:
            statistics_file.write(f'job {job}: {jobs.count(job)} \n')

        for city in unique_cities:
            statistics_file.write(f'city {city}: {cities.count(city)} \n')

        for country in unique_countries:
            statistics_file.write(f'country {country}: {countries.count(country)} \n')

        return None


def read_file(file_name: str):
    """
    Current function reads a file. and prints it to the console.
    :param file_name: path to file
    :return: Prints file output to the console
    """
    try:
        with open(file_name, 'r', encoding='utf-8') as file:
            content = file.read()
            print(content)
    except FileNotFoundError:
        print('File not found')


if __name__ == '__main__':
    try:
        create_file()
    except FileExistsError:
        print('File already exists')
    write_file()
    read_file('statistics.txt')
