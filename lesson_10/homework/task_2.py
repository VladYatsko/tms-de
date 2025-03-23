def normalize_data(path_to_file: str) -> list:
    with open(path_to_file, 'r', encoding='utf-8') as raw_file:
        raw_data = raw_file.readlines()

        normalized_data = []

        for i in range(len(raw_data)):
            normalized_data.append(raw_data[i].strip().split(':'))

        return normalized_data


def clean_data(data: list) -> list:
    clean_dataset = []

    for item in data:
        if 'ERROR' in item:
            continue
        else:
            clean_dataset.append(item)

    return clean_dataset


def write_cleaned_data(path_to_file: str, cleaned_data: list) -> None:
    with open(path_to_file, 'w', encoding='utf-8') as file:
        for item in cleaned_data:
            file.write(f'{item[0]}:{item[1]}:{item[2]}\n')

        return None


if __name__ == '__main__':
    normal_data = normalize_data('.\\files\\raw_data.txt')
    cleansed_data = clean_data(normal_data)
    write_cleaned_data('.\\files\\raw_data.txt', cleansed_data)
