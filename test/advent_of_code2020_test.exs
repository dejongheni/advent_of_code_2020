defmodule AdventOfCode2020Test do
  use ExUnit.Case
  doctest AdventOfCode2020

  test "day1_1" do
    assert AdventOfCode2020.Days.Day1.calculate_part_1([1721, 979, 366, 299, 675, 1456]) == 514579
  end

  test "day1_1_result" do
    assert AdventOfCode2020.day1_1() == 63616
  end

  test "day1_2" do
    assert AdventOfCode2020.Days.Day1.calculate_part_2([1721, 979, 366, 299, 675, 1456]) == 241861950
  end

  test "day1_2_result" do
    assert AdventOfCode2020.day1_2() == 67877784
  end

  test "day2_1" do
    assert AdventOfCode2020.Days.Day2.calculate_part_1(["1-3 a: abcde", "1-3 b: cdefg", "2-9 c: ccccccccc"]) == 2
  end

  test "day2_1_result" do
    assert AdventOfCode2020.day2_1() == 569
  end

  test "day2_2" do
    assert AdventOfCode2020.Days.Day2.calculate_part_2(["1-3 a: abcde", "1-3 b: cdefg", "2-9 c: ccccccccc"]) == 1
  end

  test "day2_2_result" do
    assert AdventOfCode2020.day2_2() == 346
  end

  test "day3_1" do
    assert AdventOfCode2020.Days.Day3.calculate_part_1(["..##.......", "#...#...#..", ".#....#..#.", "..#.#...#.#", ".#...##..#.", "..#.##.....", ".#.#.#....#", ".#........#", "#.##...#...", "#...##....#", ".#..#...#.#"]) == 7
  end

  test "day3_1_result" do
    assert AdventOfCode2020.day3_1() == 164
  end

  test "day3_2" do
    assert AdventOfCode2020.Days.Day3.calculate_part_2(
      ["..##.......", "#...#...#..", ".#....#..#.", "..#.#...#.#", ".#...##..#.", "..#.##.....", ".#.#.#....#", ".#........#", "#.##...#...", "#...##....#", ".#..#...#.#"],
      [{1,1}, {3,1}, {5,1}, {7,1}, {1,2}]
    ) == 336
  end

  test "day3_2_result" do
    assert AdventOfCode2020.day3_2() == 5007658656
  end
end
