defmodule AdventOfCode2020.Days.Day10 do
  import AdventOfCode2020.Utils
  use Agent

  def start_link() do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  def calculate_part_1(input) do
    data =
      input
      |> file_to_list_break_line()
      |> list_of_strings_to_int()
      |> Enum.sort()
    {_, list_of_diff} = calculate_diff(data)
    aggregate_diffs(list_of_diff)
    |> calculate_res()
  end

  def calculate_diff(data) do
    Enum.reduce(data, {0, []}, fn x, {prev, acc} ->
      {x, [{prev - x, x}] ++ acc}
    end)
  end

  def aggregate_diffs(list_of_diff) do
    Enum.group_by(list_of_diff, &(elem(&1, 0)))
  end

  def calculate_res(diffs) do
    length(diffs[-1]) * (length(diffs[-3]) + 1)
  end

  def calculate_part_2(input) do
    data =
      input
      |> file_to_list_break_line()
      |> list_of_strings_to_int()
      |> Enum.sort()
    last = List.last(data) + 3
    if !(Process.whereis(__MODULE__)) do
      {:ok, _} = AdventOfCode2020.Days.Day10.start_link()
    end
    calculate_combinations([0] ++ data ++ [last], last)
  end

  def calculate_combinations(_, 0), do: 1
  def calculate_combinations(data, number) do
    if number in data do
      already_calculated = Agent.get(__MODULE__, & &1)[number]
      if already_calculated do
        already_calculated
      else
        res = calculate_combinations(data, number - 1) + calculate_combinations(data, number - 2) + calculate_combinations(data, number - 3)
        Agent.update(__MODULE__, &(Map.put(&1, number, res)))
        res
      end
    else
      0
    end
  end
end
