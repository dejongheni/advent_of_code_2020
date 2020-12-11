defmodule AdventOfCode2020 do
  import AdventOfCode2020.Utils

  def day1_1, do: read_file("inputs/input_day_1.txt") |> AdventOfCode2020.Days.Day1.calculate_part_1()

  def day1_2, do: read_file("inputs/input_day_1.txt") |> AdventOfCode2020.Days.Day1.calculate_part_2()

  def day2_1, do: read_file("inputs/input_day_2.txt") |> AdventOfCode2020.Days.Day2.calculate_part_1()

  def day2_2, do: read_file("inputs/input_day_2.txt") |> AdventOfCode2020.Days.Day2.calculate_part_2()

  def day3_1, do: read_file("inputs/input_day_3.txt") |> AdventOfCode2020.Days.Day3.calculate_part_1()

  def day3_2, do: read_file("inputs/input_day_3.txt") |> AdventOfCode2020.Days.Day3.calculate_part_2([{1,1}, {3,1}, {5,1}, {7,1}, {1,2}])

  def day4_1, do: read_file("inputs/input_day_4.txt") |> AdventOfCode2020.Days.Day4.calculate_part_1()

  def day4_2, do: read_file("inputs/input_day_4.txt") |> AdventOfCode2020.Days.Day4.calculate_part_2()

  def day5_1, do: read_file("inputs/input_day_5.txt") |> AdventOfCode2020.Days.Day5.calculate_part_1()

  def day5_2, do: read_file("inputs/input_day_5.txt") |> AdventOfCode2020.Days.Day5.calculate_part_2()

  def day6_1, do: read_file("inputs/input_day_6.txt") |> AdventOfCode2020.Days.Day6.calculate_part_1()

  def day6_2, do: read_file("inputs/input_day_6.txt") |> AdventOfCode2020.Days.Day6.calculate_part_2()

  def day7_1, do: read_file("inputs/input_day_7.txt") |> AdventOfCode2020.Days.Day7.calculate_part_1()

  def day7_2, do: read_file("inputs/input_day_7.txt") |> AdventOfCode2020.Days.Day7.calculate_part_2()

  def day8_1, do: read_file("inputs/input_day_8.txt") |> AdventOfCode2020.Days.Day8.calculate_part_1()

  def day8_2, do: read_file("inputs/input_day_8.txt") |> AdventOfCode2020.Days.Day8.calculate_part_2()

  def day9_1, do: read_file("inputs/input_day_9.txt") |> AdventOfCode2020.Days.Day9.calculate_part_1(25)

  def day9_2, do: read_file("inputs/input_day_9.txt") |> AdventOfCode2020.Days.Day9.calculate_part_2(25)

  def day10_1, do: read_file("inputs/input_day_10.txt") |> AdventOfCode2020.Days.Day10.calculate_part_1()

  def day10_2, do: read_file("inputs/input_day_10.txt") |> AdventOfCode2020.Days.Day10.calculate_part_2()
end
