def print_grid(arr):
    for i in range(5):
        for j in range(5):
            # 注意，在py3.x中，print函数默认都有换行
            print(arr[i][j], end="")
        print()


# 找出目前没有被赋值的位置，若全部都被填满，则返回False
def find_empty_location(arr, l):
    for row in range(5):
        for col in range(5):
            if arr[row][col] == 0:
                l[0] = row
                l[1] = col
                # print("empty: row="+str(row)+" col="+str(col))
                return True
    return False


# 找出num在该arr的row行是否出现过
def used_in_row(arr, row, num):
    for i in range(5):
        if arr[row][i] == num:
            return True
    return False


# 找出num在该arr的col列是否出现过
def used_in_col(arr, col, num):
    for i in range(5):
        if arr[i][col] == num:
            return True
    return False


def check_location_is_safe(arr, row, col, num):
    return not used_in_row(arr, row, num) and not used_in_col(arr, col, num)


def solve_sudoku(arr):
    # 当前搜索的第几行、第几列
    l = [0, 0]
    # 找出还未被填充的位置
    if not find_empty_location(arr, l):
        return True
    # 未被填充的位置，赋值给row，col
    row = l[0]
    col = l[1]

    for num in range(1, 6):
        if check_location_is_safe(arr, row, col, num):
            arr[row][col] = num
            #print_grid(arr)
            if solve_sudoku(arr):
                return True
            # 若当前num导致未来并没有结果，则当前所填充的数无效，置0后选下一个数测试
            arr[row][col] = 0

    return False


if __name__ == "__main__":

    grid = [[0 for x in range(5)] for y in range(5)]

    grid = [[ 2, 5, 0, 3,4],
            [4, 1, 0, 2, 0],
            [1, 0, 3, 4, 0],
            [0, 4, 0, 0, 1],
            [5,3, 0, 0, 2]]
#使用1-5填充，空用0填充
    if solve_sudoku(grid):
        print_grid(grid)
    else:
        print("No solution exists\n")