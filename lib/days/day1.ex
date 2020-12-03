defmodule AdventOfCode2020.Days.Day1 do
  def calculate_part_1(expanse_report) do
    Enum.find_value(expanse_report, fn x ->
      if y_value = Enum.find(expanse_report, fn y -> x+y == 2020 end) do
        y_value * x
      end
    end)
  end

  def calculate_part_2(expanse_report) do
    Enum.find_value(expanse_report, fn x ->
      y_value =
        Enum.find_value(expanse_report, fn y ->
          if z_value = Enum.find(expanse_report, fn z -> x+y+z == 2020 end) do
            z_value * y
          end
        end)
      if y_value do
        y_value * x
      end
    end)
  end
end
