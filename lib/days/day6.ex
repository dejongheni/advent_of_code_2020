defmodule AdventOfCode2020.Days.Day6 do
  def calculate_part_1(list_of_string) do
    Enum.flat_map(list_of_string, fn x ->
      String.replace(x, "\n", "")
      |> String.graphemes()
      |> Enum.uniq()
    end)
    |> Enum.count()
  end

  def calculate_part_2(list_of_string) do
    Enum.flat_map(list_of_string, fn x ->
      length = String.split(x, "\n") |> Enum.count()
      String.replace(x, "\n", "")
      |> String.graphemes()
      |> Enum.group_by(&(&1))
      |> Enum.filter(fn {_key, value} -> Enum.count(value) == length end)
    end)
    |> Enum.count()
  end
end
