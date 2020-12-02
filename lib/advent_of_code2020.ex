defmodule AdventOfCode2020 do
  import AdventOfCode2020.Utils

  def day1_1 do
    read_file("inputs/input_day_1.txt")
    |> file_to_list_break_line()
    |> list_of_strings_to_int()
    |> AdventOfCode2020.Days.Day1_1.calculate()
  end

  def day1_2 do
    read_file("inputs/input_day_1.txt")
    |> file_to_list_break_line()
    |> list_of_strings_to_int()
    |> AdventOfCode2020.Days.Day1_2.calculate()
  end

  def day2_1 do
    read_file("inputs/input_day_2.txt")
    |> file_to_list_break_line()
    |> AdventOfCode2020.Days.Day2_1.calculate()
  end

  def day2_2 do
    read_file("inputs/input_day_2.txt")
    |> file_to_list_break_line()
    |> AdventOfCode2020.Days.Day2_2.calculate()
  end
end
