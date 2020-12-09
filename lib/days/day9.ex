defmodule AdventOfCode2020.Days.Day9 do
  import AdventOfCode2020.Utils

  def calculate_part_1(input, preamble_size) do
    data =
      input
      |> file_to_list_break_line()
      |> list_of_strings_to_int()
    {preamble, data} = Enum.split(data, preamble_size)
    find_wrong_value(data, preamble)
  end

  def calculate_part_2(input, preamble_size) do
    data =
      input
      |> file_to_list_break_line()
      |> list_of_strings_to_int()
    {preamble, rest_of_data} = Enum.split(data, preamble_size)
    find_wrong_value(rest_of_data, preamble)
    |> find_contiguous(data)
    |> calculate_weakness()
  end

  def find_wrong_value([hd|tail], preamble = [_ | tail_preamble]) do
    if Enum.all?(preamble, fn x -> hd - x not in preamble end) do
      hd
    else
      find_wrong_value(tail, tail_preamble ++ [hd])
    end
  end

  def find_wrong_value([], _) do
    nil
  end

  def find_contiguous(number, data = [_|tl]) do
    find_contiguous(number, data, tl, [], 0)
  end

  def find_contiguous(number, [number | tl], to_check, values_acc, acc) do
    find_contiguous(number, tl, to_check, values_acc, acc)
  end

  def find_contiguous(number, [hd | tl], to_check, values_acc, acc) do
    new_acc = acc + hd
    case new_acc do
      new_acc when new_acc > number -> find_contiguous(number, to_check)
      new_acc when new_acc < number -> find_contiguous(number, tl, to_check, [hd] ++ values_acc, new_acc)
      new_acc when new_acc == number -> [hd] ++ values_acc
    end
  end

  def find_contiguous(_, [], _, values_acc, _) do
    values_acc
  end

  def calculate_weakness(data) do
    Enum.min(data) + Enum.max(data)
  end
end
