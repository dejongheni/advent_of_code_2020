defmodule AdventOfCode2020 do
  import AdventOfCode2020.Utils

  def day1_1 do
    read_file("inputs/input_day_1.txt")
    |> file_to_list_break_line()
    |> list_of_strings_to_int()
    |> AdventOfCode2020.Days.Day1.calculate_part_1()
  end

  def day1_2 do
    read_file("inputs/input_day_1.txt")
    |> file_to_list_break_line()
    |> list_of_strings_to_int()
    |> AdventOfCode2020.Days.Day1.calculate_part_2()
  end

  def day2_1 do
    read_file("inputs/input_day_2.txt")
    |> file_to_list_break_line()
    |> AdventOfCode2020.Days.Day2.calculate_part_1()
  end

  def day2_2 do
    read_file("inputs/input_day_2.txt")
    |> file_to_list_break_line()
    |> AdventOfCode2020.Days.Day2.calculate_part_2()
  end

  def day3_1 do
    read_file("inputs/input_day_3.txt")
    |> file_to_list_break_line()
    |> AdventOfCode2020.Days.Day3.calculate_part_1()
  end

  def day3_2 do
    read_file("inputs/input_day_3.txt")
    |> file_to_list_break_line()
    |> AdventOfCode2020.Days.Day3.calculate_part_2([{1,1}, {3,1}, {5,1}, {7,1}, {1,2}])
  end

  def day4_1 do
    read_file("inputs/input_day_4.txt")
    |> file_to_list_blank_line()
    |> AdventOfCode2020.Days.Day4.calculate_part_1()
  end

  def day4_2 do
    read_file("inputs/input_day_4.txt")
    |> file_to_list_blank_line()
    |> AdventOfCode2020.Days.Day4.calculate_part_2()
  end

  def day5_1 do
    read_file("inputs/input_day_5.txt")
    |> file_to_list_break_line()
    |> AdventOfCode2020.Days.Day5.calculate_part_1()
  end

  def day5_2 do
    read_file("inputs/input_day_5.txt")
    |> file_to_list_break_line()
    |> AdventOfCode2020.Days.Day5.calculate_part_2()
  end

  def day6_1 do
    read_file("inputs/input_day_6.txt")
    |> file_to_list_blank_line()
    |> AdventOfCode2020.Days.Day6.calculate_part_1()
  end

  def day6_2 do
    read_file("inputs/input_day_6.txt")
    |> file_to_list_blank_line()
    |> AdventOfCode2020.Days.Day6.calculate_part_2()
  end
end
