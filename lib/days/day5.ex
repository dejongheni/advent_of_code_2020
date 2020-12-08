defmodule AdventOfCode2020.Days.Day5 do
  import AdventOfCode2020.Utils

  def calculate_part_1(input) do
    input
    |> file_to_list_break_line()
    |> Enum.map(fn seat -> calculate_seat(seat) end)
    |> Enum.max
  end

  def calculate_part_2(input) do
    input
    |> file_to_list_break_line()
    |> Enum.map(fn seat -> calculate_seat(seat) end)
    |> find_free_seat()
  end

  def calculate_seat(seat) do
    {row, column} = String.graphemes(seat) |> Enum.split(7)
    row = calculate_row(row, 0, 127)
    column = calculate_column(column, 0, 7)
    row * 8 + column
  end

  def calculate_row(["F"], front_pos, _back_pos), do: front_pos
  def calculate_row(["B"], _front_pos, back_pos), do: back_pos
  def calculate_row(["F" | row], front_pos, back_pos), do: calculate_row(row, front_pos, calculate_pos(front_pos, back_pos, &trunc/1))
  def calculate_row(["B" | row], front_pos, back_pos), do: calculate_row(row, calculate_pos(front_pos, back_pos, &round/1), back_pos)

  def calculate_column(["L"], left_pos, _right_pos), do: left_pos
  def calculate_column(["R"], _left_pos, right_pos), do: right_pos
  def calculate_column(["L" | column], left_pos, right_pos), do: calculate_column(column, left_pos, calculate_pos(left_pos, right_pos, &trunc/1))
  def calculate_column(["R" | column], left_pos, right_pos), do: calculate_column(column, calculate_pos(left_pos, right_pos, &round/1), right_pos)

  def calculate_pos(pos1, pos2, round_function) do
    round_function.(pos1 + pos2 - (pos1 + pos2) / 2)
  end

  def find_free_seat(seats) do
    Enum.to_list(Enum.min(seats)..Enum.max(seats)) -- seats
    |> hd()
  end
end
