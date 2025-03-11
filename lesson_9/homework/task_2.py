def create_file() -> None:
    """
    Current function creates a new file.
    :return: Creates file
    """
    return open('.\\files\\report.txt', 'x').close()


def merge_students_grades() -> list:
    """
    Current function creates merged list of students grades.
    :return: list of students grades.
    """
    with (open('.\\files\\students.txt', 'r', encoding='utf-8') as students,
          open('.\\files\\grades.txt', 'r', encoding='utf-8') as grades):
        students_records = students.readlines()
        grades_records = grades.readlines()

        student_list = []

        for i in range(len(students_records)):
            student_list.append(students_records[i].strip().split(','))

        grades_list = []

        for i in range(len(grades_records)):
            grades_list.append(grades_records[i].strip().split(','))

        final_list = []

        for i in range(len(student_list)):
            student_list[i] += grades_list[i][1].strip().split(' ')
            final_list.append(student_list[i])

        return final_list


def calculate_average_grade_per_student(merged_list: list) -> list:
    """
    Current function calculates average grade for each student.
    :param merged_list: merged list of students grades.
    :return: list with average grade for each student.
    """
    for i in range(len(merged_list)):
        merged_list[i].append(f'Average mark is {sum([int(_) for _ in merged_list[i][2:]]) / len(merged_list[i][2:])}')

    return merged_list


def write_grades_to_file(list_with_avg_mark: list) -> None:
    """
    Current function writes grades to file.
    :param list_with_avg_mark: merged list with average mark for each student.
    :return: None. Writes grades to file.
    """
    with open('.\\files\\report.txt', 'a', encoding='utf-8') as report_file:
        for elem in list_with_avg_mark:
            report_file.write(' ,'.join(elem) + '\n')

        return None


def calculate_average_per_group(merged_list: list) -> dict:
    """
    Current function calculates average grade for each student.
    :param merged_list: List of students grades.
    :return: Dictionary with average grade for each group.
    """
    final_dict = {}

    for i in range(len(merged_list)):
        final_dict[merged_list[i][1]] = 0

    for key in final_dict.keys():
        for i in range(len(merged_list)):
            if key == merged_list[i][1]:
                final_dict[key] += sum([int(_) for _ in merged_list[i][2:-1]])

    for key in final_dict.keys():
        key_counter = 0

        for i in range(len(merged_list)):
            if key == merged_list[i][1]:
                key_counter += 1

        if key_counter > 0:
            final_dict[key] = final_dict[key] / (key_counter * 5)

    return dict(sorted(final_dict.items(), key=lambda item: item[1]))


def write_group_average(dict_with_marks: dict) -> None:
    """
    Current function writes average grade for each group.
    :param dict_with_marks: Dictionary with average grade for each group.
    :return: None. Writes average grade for each group.
    """
    with open('.\\files\\report.txt', 'a', encoding='utf-8') as report_file:
        for key, value in dict_with_marks.items():
            report_file.write(f'{key}: {value}\n')

        return None


if __name__ == '__main__':
    try:
        create_file()
    except FileExistsError:
        print('File already exists.')
    finally:
        total_grades_list = merge_students_grades()
        list_avg_mark = calculate_average_grade_per_student(total_grades_list)
        write_grades_to_file(list_avg_mark)
        dict_avg_group = calculate_average_per_group(total_grades_list)
        write_group_average(dict_avg_group)
