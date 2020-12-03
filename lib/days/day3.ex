defmodule AdventOfCode2020.Days.Day3 do
  def calculate_part_1(slope) do
    slope_to_integers(slope)
    |> calculate_tree_encountered(0, 3, 1, 1, 0)
  end

  def calculate_part_2(slope, offset_list) do
    slope = slope_to_integers(slope)
    Enum.map(offset_list, fn {offset_right, offset_down} ->
      calculate_tree_encountered(slope, 0, offset_right, offset_down, offset_down, 0)
    end)
    |> Enum.reduce(1, fn x, acc -> x * acc end)
  end

  def slope_to_integers(slope) do
    Enum.map(slope, fn row ->
      String.graphemes(row)
      |> Enum.map(fn
        "."    -> 0
        "#"    -> 1
        symbol -> symbol
      end)
    end)
  end

  def calculate_tree_encountered([row | rest_slope], pos, offset_right, offset_counter, offset_down, nb_trees) when offset_counter == offset_down do
    nb_trees = nb_trees + Enum.at(row, pos)
    new_pos = Integer.mod(pos + offset_right, Enum.count(row))
    offset_counter = 1
    calculate_tree_encountered(rest_slope, new_pos, offset_right, offset_counter, offset_down, nb_trees)
  end

  def calculate_tree_encountered([_row | rest_slope], pos, offset_right, offset_counter, offset_down, nb_trees) do
    offset_counter = offset_counter + 1
    calculate_tree_encountered(rest_slope, pos, offset_right, offset_counter, offset_down, nb_trees)
  end

  def calculate_tree_encountered([], _, _, _, _, nb_trees) do
    nb_trees
  end
end
