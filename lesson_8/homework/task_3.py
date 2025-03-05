spiral_matrix = [
    [1, 2, 3, 10],
    [4, 5, 6, 11],
    [7, 8, 9, 12]
]

for i in range(len(spiral_matrix)):
    if i % 2 != 0:
        spiral_matrix[i] = spiral_matrix[i][::-1]
    for j in range(len(spiral_matrix[0])):
        print(spiral_matrix[i][j])
