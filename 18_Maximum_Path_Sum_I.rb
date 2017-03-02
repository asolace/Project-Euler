# Maximum path sum I
# Problem 18
#
# By starting at the top of the triangle below and moving to adjacent numbers
# on the row below, the maximum total from top to bottom is 23.
TRIANGLE1 = "   3
              7   4
            2   4   6
          8   5   9   3"

# That is, 3 + 7 + 4 + 9 = 23.
#
# Find the maximum total from top to bottom of the triangle below:
TRIANGLE2 = "                 75
                            95  64
                          17  47  82
                        18  35  87  10
                      20  04  82  47  65
                    19  01  23  75  03  34
                  88  02  77  73  07  63  67
                99  65  04  28  06  16  70  92
              41  41  26  56  83  40  80  70  33
            41  48  72  33  47  32  37  16  94  29
          53  71  44  65  25  43  91  52  97  51  14
        70  11  33  28  77  73  17  78  39  68  17  57
      91  71  52  38  17  14  91  43  58  50  27  29  48
    63  66  04  68  89  53  67  30  73  16  69  87  40  31
  04  62  98  27  23  09  70  98  73  93  38  53  60  04  23"

# NOTE: As there are only 16384 routes,
# it is possible to solve this problem by trying every route.
# However, Problem 67, is the same challenge with a triangle containing
# one-hundred rows; it cannot be solved by brute force,
# and requires a clever method! ;o)


def maxPathSum(triangle)
  # Setting up 2d array from the triangle string.
  array = triangle
    .split("\n")
    .map! { |c| c.split(" ")
    .map! { |c| c.to_i } }

  (array.length - 1).downto(0) do |i|
    0.upto(i-1) do |j|
      array[i-1][j] += [ array[i][j], array[i][j+1] ].max
    end
  end

  array.first.first
end

puts maxPathSum(TRIANGLE2)

# ### To understand lines 44 - 48 more clearly/visualy: ###
# We will demostrate TRIANGLE1 as example:

TRIANGLE1 = "   3
              7   4
            2   4   6
          8   5   9   3"

=begin
[[3], [7, 4], [2, 4, 6], [8, 5, 9, 3]]

  See pyramid for reference and visual guidence
  -- This is the 2nd to last layer --
    2
    [8, 5]  # 2 compares 8 & 5 (.max which is 8) so 2 += 8 (10)
    [... , [10, 4, 6], [8, 5, 9, 3]]

    4
    [5, 9] # 4 compares 5 & 9 (.max which is 9) so 4 += 9 (13)
    [... , [10, 13, 6], [8, 5, 9, 3]]

    6
    [9, 3]
    [... , [10, 13, 15], [8, 5, 9, 3]]

      -- This is the upper layer --
        7
        [10, 13]
        [[3], [20, 4], [10, 13, 15], [8, 5, 9, 3]]

        4
        [13, 15]
        [[3], [20, 19], [10, 13, 15], [8, 5, 9, 3]]

          -- This is the top --
            3           # As everything is finish comparing (.max)
            [20, 19]    # top value stored at array[0][0]
            [[23], [20, 19], [10, 13, 15], [8, 5, 9, 3]]

=end


#       3         =>         3         =>          3        =>        23
#     7   4       =>       7   4       =>       20  19      =>      20  19
#   2   4   6     =>     10  13  15    =>     10  13  15    =>    10  13  15
# 8   5   9   3   =>   8   5   9   3   =>   8   5   9   3   =>   8   5   9   3
