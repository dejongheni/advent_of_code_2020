defmodule AdventOfCode2020Test do
  use ExUnit.Case
  doctest AdventOfCode2020

  test "day1_1" do
    assert AdventOfCode2020.Days.Day1_1.calculate([1721, 979, 366, 299, 675, 1456]) == 514579
  end

  test "day1_1_result" do
    assert AdventOfCode2020.day1_1() == 63616
  end

  test "day1_2" do
    assert AdventOfCode2020.Days.Day1_2.calculate([1721, 979, 366, 299, 675, 1456]) == 241861950
  end

  test "day1_2_result" do
    assert AdventOfCode2020.day1_2() == 67877784
  end
end
