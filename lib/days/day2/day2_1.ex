defmodule AdventOfCode2020.Days.Day2_1 do
  def calculate(password_list) do
    passwords_to_list_of_infos(password_list)
    |> Enum.count(&password_valid?/1)
  end

  def passwords_to_list_of_infos(password_list) do
    Enum.map(password_list, fn password_infos ->
      [string_range, letter, password] =
        String.replace(password_infos, ":", "")
        |> String.split(" ", trim: true)
      [range_start, range_end] =
        String.split(string_range, "-")
        |> Enum.map(&String.to_integer/1)
      range = Range.new(range_start, range_end)
      [range, letter, password]
    end)
  end

  def password_valid?([range, letter, password]) do
    count_letter_occurences =
      String.graphemes(password)
      |> Enum.count(&(&1 == letter))
    count_letter_occurences in range
  end
end
