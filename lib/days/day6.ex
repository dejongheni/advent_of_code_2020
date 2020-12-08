defmodule AdventOfCode2020.Days.Day6 do
  import AdventOfCode2020.Utils

  def calculate_part_1(input) do
    input
    |> file_to_list_blank_line()
    |> Enum.flat_map(fn x ->
        String.replace(x, "\n", "")
        |> String.graphemes()
        |> Enum.uniq()
      end)
    |> Enum.count()
  end

  def calculate_part_2(input) do
    input
    |> file_to_list_blank_line()
    |> Enum.flat_map(fn x ->
        length = String.split(x, "\n") |> Enum.count()
        String.replace(x, "\n", "")
        |> String.graphemes()
        |> Enum.group_by(&(&1))
        |> Enum.filter(fn {_key, value} -> Enum.count(value) == length end)
      end)
    |> Enum.count()
  end
end
