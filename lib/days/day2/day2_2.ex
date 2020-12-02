defmodule AdventOfCode2020.Days.Day2_2 do
  def calculate(password_list) do
    passwords_to_list_of_infos(password_list)
    |> Enum.count(&password_valid?/1)
  end

  def passwords_to_list_of_infos(password_list) do
    Enum.map(password_list, fn password_infos ->
      [string_range, letter, password] =
        String.replace(password_infos, ":", "")
        |> String.split(" ", trim: true)
      [pos1, pos2] =
        String.split(string_range, "-")
        |> Enum.map(&String.to_integer/1)
      [pos1, pos2, letter, password]
    end)
  end

  def password_valid?([pos1, pos2, letter, password]) do
    string_list = String.graphemes(password)
    char_at_pos1 = Enum.at(string_list, pos1 - 1)
    char_at_pos2 = Enum.at(string_list, pos2 - 1)
    char_at_pos1 != char_at_pos2 and (char_at_pos1 == letter or char_at_pos2 == letter)
  end
end
