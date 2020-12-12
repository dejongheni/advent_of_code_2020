defmodule AdventOfCode2020.Days.Day12 do
  import AdventOfCode2020.Utils

  def calculate_part_1(input) do
    input
    |> file_to_list_break_line()
    |> Enum.map(&parse_input/1)
    |> calculate_pos(90, 0, 0)
  end

  def calculate_part_2(input) do
    input
    |> file_to_list_break_line()
    |> Enum.map(&parse_input/1)
    |> calculate_pos_2(0, 0, 1, 10)
  end

  def parse_input(<<direction::binary-size(1), value::binary>>), do: {direction, String.to_integer(value)}

  #     0
  # 270   90
  #    180
  def calculate_pos([{"N", value} | tl], facing, north, east),     do: calculate_pos(tl, facing, north + value, east)
  def calculate_pos([{"S", value} | tl], facing, north, east),     do: calculate_pos(tl, facing, north - value, east)
  def calculate_pos([{"E", value} | tl], facing, north, east),     do: calculate_pos(tl, facing, north, east + value)
  def calculate_pos([{"W", value} | tl], facing, north, east),     do: calculate_pos(tl, facing, north, east - value)
  def calculate_pos([{"R", value} | tl], facing, north, east),     do: calculate_pos(tl, Integer.mod(facing + value, 360), north, east)
  def calculate_pos([{"L", value} | tl], facing, north, east),     do: calculate_pos(tl, Integer.mod(facing - value, 360), north, east)
  def calculate_pos([{"F", value} | tl], facing=0, north, east),   do: calculate_pos(tl, facing, north + value, east)
  def calculate_pos([{"F", value} | tl], facing=90, north, east),  do: calculate_pos(tl, facing, north, east + value)
  def calculate_pos([{"F", value} | tl], facing=180, north, east), do: calculate_pos(tl, facing, north - value, east)
  def calculate_pos([{"F", value} | tl], facing=270, north, east), do: calculate_pos(tl, facing, north, east - value)
  def calculate_pos([], _, north, east), do: abs(north) + abs(east)

  def calculate_pos_2([{"N", value} | tl], north, east, w_north, w_east), do: calculate_pos_2(tl, north, east, w_north + value, w_east)
  def calculate_pos_2([{"S", value} | tl], north, east, w_north, w_east), do: calculate_pos_2(tl, north, east, w_north - value, w_east)
  def calculate_pos_2([{"E", value} | tl], north, east, w_north, w_east), do: calculate_pos_2(tl, north, east, w_north, w_east + value)
  def calculate_pos_2([{"W", value} | tl], north, east, w_north, w_east), do: calculate_pos_2(tl, north, east, w_north, w_east - value)
  def calculate_pos_2([{"R", 0} | tl], north, east, w_north, w_east),     do: calculate_pos_2(tl, north, east, w_north, w_east)
  def calculate_pos_2([{"R", 90} | tl], north, east, w_north, w_east),    do: calculate_pos_2(tl, north, east, -w_east, w_north)
  def calculate_pos_2([{"R", 180} | tl], north, east, w_north, w_east),   do: calculate_pos_2(tl, north, east, -w_north, -w_east)
  def calculate_pos_2([{"R", 270} | tl], north, east, w_north, w_east),   do: calculate_pos_2(tl, north, east, w_east, -w_north)
  def calculate_pos_2([{"L", 0} | tl], north, east, w_north, w_east),     do: calculate_pos_2(tl, north, east, w_north, w_east)
  def calculate_pos_2([{"L", 90} | tl], north, east, w_north, w_east),    do: calculate_pos_2(tl, north, east, w_east, -w_north)
  def calculate_pos_2([{"L", 180} | tl], north, east, w_north, w_east),   do: calculate_pos_2(tl, north, east, -w_north, -w_east)
  def calculate_pos_2([{"L", 270} | tl], north, east, w_north, w_east),   do: calculate_pos_2(tl, north, east, -w_east, w_north)
  def calculate_pos_2([{"F", value} | tl], north, east, w_north, w_east), do: calculate_pos_2(tl, north + value * w_north, east + value * w_east, w_north, w_east)
  def calculate_pos_2([], north, east, _, _), do: abs(north) + abs(east)
end
