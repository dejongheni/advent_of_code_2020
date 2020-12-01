defmodule AdventOfCode2020.Days.Day1_2 do
  def calculate(expanse_report) do
    Enum.find_value(expanse_report, fn x ->
      case Enum.find_value(expanse_report, fn y ->
        case Enum.find(expanse_report, fn z -> x+y+z == 2020 end) do
          nil -> nil
          value -> value * y
        end
      end) do
        nil -> nil
        value -> value * x
      end
    end)
  end
end
