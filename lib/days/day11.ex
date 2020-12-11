defmodule AdventOfCode2020.Days.Day11 do
  import AdventOfCode2020.Utils

  def calculate_part_1(input) do
    input
    |> file_to_list_break_line()
    |> parse_list_of_strings()
    |> calculate_seats_stabilized(%{})
  end

  def calculate_seats_stabilized(data, prev_data) do
    if data == prev_data do
      Map.values(data)
      |> Enum.map(&Map.values/1)
      |> List.flatten()
      |> Enum.map(fn nil -> 0; x -> x end)
      |> Enum.sum()
    else
      new_data = calculate_next_seats(data)
      calculate_seats_stabilized(new_data, data)
    end
  end

  def calculate_next_seats(data) do
    Enum.map(data, fn {row_key, row} ->
      new_row =
        Enum.map(row, fn {key, value} ->
          adjacent_occupied_seats =
            [Map.get(row, key+1),
            Map.get(row, key-1),
            (Map.get(data, row_key+1) || %{}) |> Map.get(key-1),
            (Map.get(data, row_key+1) || %{}) |> Map.get(key),
            (Map.get(data, row_key+1) || %{}) |> Map.get(key+1),
            (Map.get(data, row_key-1) || %{}) |> Map.get(key-1),
            (Map.get(data, row_key-1) || %{}) |> Map.get(key),
            (Map.get(data, row_key-1) || %{}) |> Map.get(key+1)]
            |> Enum.map(fn nil -> 0; x -> x end)
            |> Enum.sum()
          if value == 0 and adjacent_occupied_seats == 0 do
            {key, 1}
          else
            if value == 1 and adjacent_occupied_seats >= 4 do
              {key, 0}
            else
              {key, value}
            end
          end
        end)
        |> Enum.into(%{})
      {row_key, new_row}
    end)
    |> Enum.into(%{})
  end

  def calculate_part_2(input) do
    input
    |> file_to_list_break_line()
    |> parse_list_of_strings()
    |> calculate_seats_stabilized_2(%{})
  end

  def calculate_seats_stabilized_2(data, prev_data) do
    if data == prev_data do
      Map.values(data)
      |> Enum.map(&Map.values/1)
      |> List.flatten()
      |> Enum.map(fn nil -> 0; x -> x end)
      |> Enum.sum()
    else
      new_data = calculate_next_seats_2(data)
      calculate_seats_stabilized_2(new_data, data)
    end
  end

  def calculate_next_seats_2(data) do
    Enum.map(data, fn {row_key, row} ->
      new_row =
        Enum.map(row, fn {key, value} ->
          adjacent_occupied_seats =
            [find_in_row(:next, row, key+1),
             find_in_row(:prev, row, key-1),
             find_in_col(:next, :prev, data, row_key+1, key-1),
             find_in_col(:next, :none, data, row_key+1, key),
             find_in_col(:next, :next, data, row_key+1, key+1),
             find_in_col(:prev, :prev, data, row_key-1, key-1),
             find_in_col(:prev, :none, data, row_key-1, key),
             find_in_col(:prev, :next, data, row_key-1, key+1)]
            |> Enum.map(fn nil -> 0; x -> x end)
            |> Enum.sum()
          if value == 0 and adjacent_occupied_seats == 0 do
            {key, 1}
          else
            if value == 1 and adjacent_occupied_seats >= 5 do
              {key, 0}
            else
              {key, value}
            end
          end
        end)
        |> Enum.into(%{})
      {row_key, new_row}
    end)
    |> Enum.into(%{})
  end

  def find_in_row(position, row, key) do
    if Map.has_key?(row, key) do
      value = Map.get(row, key)
      if value do
        value
      else
        new_key =
          if position == :next do
            key + 1
          else
            key - 1
          end
        find_in_row(position, row, new_key)
      end
    else
      0
    end
  end

  def find_in_col(position_col, position_row, data, row_key, val_key) do
    if Map.has_key?(data, row_key) do
      row = data[row_key]
      if Map.has_key?(row, val_key) do
        value = Map.get(row, val_key)
        if value do
          value
        else
          new_val_key =
            case position_row do
              :next -> val_key + 1
              :prev -> val_key - 1
              :none -> val_key
            end
          new_row_key =
            case position_col do
              :next -> row_key + 1
              :prev -> row_key - 1
            end
          find_in_col(position_col, position_row, data, new_row_key, new_val_key)
        end
      else
        0
      end
    else
      0
    end
  end

  def parse_list_of_strings(data) do
    Enum.map(data, fn x ->
      String.graphemes(x)
      |> Enum.with_index()
      |> Enum.map(fn
        {"L", k} -> {k, 0}
        {".", k} -> {k, nil}
        {"#", k} -> {k, 1}
      end)
      |> Enum.into(%{})
    end)
    |> Enum.with_index()
    |> Enum.map(fn {v, k} -> {k, v} end)
    |> Enum.into(%{})
  end
end
