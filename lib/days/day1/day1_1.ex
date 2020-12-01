defmodule AdventOfCode2020.Days.Day1_1 do
  def calculate(expanse_report) do
    Enum.find_value(expanse_report, fn x ->
      case Enum.find(expanse_report, fn y -> x+y == 2020 end) do
        nil -> nil
        value -> value * x
      end
    end)
  end
end
