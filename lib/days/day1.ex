defmodule AdventOfCode2020.Days.Day1 do
  import AdventOfCode2020.Utils

  def calculate_part_1(input) do
    expanse_report =
      input
      |> file_to_list_break_line()
      |> list_of_strings_to_int()
    Enum.find_value(expanse_report, fn x ->
      if y_value = Enum.find(expanse_report, fn y -> x+y == 2020 end) do
        y_value * x
      end
    end)
  end

  def calculate_part_2(input) do
    expanse_report =
      input
      |> file_to_list_break_line()
      |> list_of_strings_to_int()
    Enum.find_value(expanse_report, fn x ->
      y_value =
        Enum.find_value(expanse_report, fn y ->
          if z_value = Enum.find(expanse_report, fn z -> x+y+z == 2020 end) do
            z_value * y
          end
        end)
      if y_value do
        y_value * x
      end
    end)
  end
end
