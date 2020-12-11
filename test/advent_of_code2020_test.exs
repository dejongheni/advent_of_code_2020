defmodule AdventOfCode2020Test do
  use ExUnit.Case
  doctest AdventOfCode2020

  test "day1_1" do
    assert AdventOfCode2020.Days.Day1.calculate_part_1("1721\n979\n366\n299\n675\n1456") == 514579
  end

  test "day1_1_result" do
    assert AdventOfCode2020.day1_1() == 63616
  end

  test "day1_2" do
    assert AdventOfCode2020.Days.Day1.calculate_part_2("1721\n979\n366\n299\n675\n1456") == 241861950
  end

  test "day1_2_result" do
    assert AdventOfCode2020.day1_2() == 67877784
  end

  test "day2_1" do
    assert AdventOfCode2020.Days.Day2.calculate_part_1("1-3 a: abcde\n1-3 b: cdefg\n2-9 c: ccccccccc") == 2
  end

  test "day2_1_result" do
    assert AdventOfCode2020.day2_1() == 569
  end

  test "day2_2" do
    assert AdventOfCode2020.Days.Day2.calculate_part_2("1-3 a: abcde\n1-3 b: cdefg\n2-9 c: ccccccccc") == 1
  end

  test "day2_2_result" do
    assert AdventOfCode2020.day2_2() == 346
  end

  test "day3_1" do
    assert AdventOfCode2020.Days.Day3.calculate_part_1("..##.......\n#...#...#..\n.#....#..#.\n..#.#...#.#\n.#...##..#.\n..#.##.....\n.#.#.#....#\n.#........#\n#.##...#...\n#...##....#\n.#..#...#.#") == 7
  end

  test "day3_1_result" do
    assert AdventOfCode2020.day3_1() == 164
  end

  test "day3_2" do
    assert AdventOfCode2020.Days.Day3.calculate_part_2(
      "..##.......\n#...#...#..\n.#....#..#.\n..#.#...#.#\n.#...##..#.\n..#.##.....\n.#.#.#....#\n.#........#\n#.##...#...\n#...##....#\n.#..#...#.#",
      [{1,1}, {3,1}, {5,1}, {7,1}, {1,2}]
    ) == 336
  end

  test "day3_2_result" do
    assert AdventOfCode2020.day3_2() == 5007658656
  end

  test "day4_1" do
    assert AdventOfCode2020.Days.Day4.calculate_part_1(
      "ecl:gry pid:860033327 eyr:2020 hcl:#fffffd\nbyr:1937 iyr:2017 cid:147 hgt:183cm\n\niyr:2013 ecl:amb cid:350 eyr:2023 pid:028048884\nhcl:#cfa07d byr:1929\n\nhcl:#ae17e1 iyr:2013\neyr:2024\necl:brn pid:760753108 byr:1931\nhgt:179cm\n\nhcl:#cfa07d eyr:2025 pid:166559648\niyr:2011 ecl:brn hgt:59in"
      ) == 2
  end

  test "day4_1_result" do
    assert AdventOfCode2020.day4_1() == 208
  end

  test "day4_2_invalid" do
    assert AdventOfCode2020.Days.Day4.calculate_part_2(
      "eyr:1972 cid:100\nhcl:#18171d ecl:amb hgt:170 pid:186cm iyr:2018 byr:1926\n\niyr:2019\nhcl:#602927 eyr:1967 hgt:170cm\necl:grn pid:012533040 byr:1946\n\nhcl:dab227 iyr:2012\necl:brn hgt:182cm pid:021572410 eyr:2020 byr:1992 cid:277\n\nhgt:59cm ecl:zzz\neyr:2038 hcl:74454a iyr:2023\npid:3556412378 byr:2007"
    ) == 0
  end

  test "day4_2_valid" do
    assert AdventOfCode2020.Days.Day4.calculate_part_2(
      "pid:087499704 hgt:74in ecl:grn iyr:2012 eyr:2030 byr:1980\nhcl:#623a2f\n\neyr:2029 ecl:blu cid:129 byr:1989\niyr:2014 pid:896056539 hcl:#a97842 hgt:165cm\n\nhcl:#888785\nhgt:164cm byr:2001 iyr:2015 cid:88\npid:545766238 ecl:hzl\neyr:2022\n\niyr:2010 hgt:158cm hcl:#b6652a ecl:blu byr:1944 eyr:2021 pid:093154719"
    ) == 4
  end

  test "day4_2_result" do
    assert AdventOfCode2020.day4_2() == 167
  end

  test "day5_1_test_1" do
    assert AdventOfCode2020.Days.Day5.calculate_seat("BFFFBBFRRR") == 567
  end

  test "day5_1_test_2" do
    assert AdventOfCode2020.Days.Day5.calculate_seat("FBFBBFFRLR") == 357
  end

  test "day5_1_test_3" do
    assert AdventOfCode2020.Days.Day5.calculate_seat("FFFBBBFRRR") == 119
  end

  test "day5_1_test_4" do
    assert AdventOfCode2020.Days.Day5.calculate_seat("BBFFBBFRLL") == 820
  end

  test "day5_1_result" do
    assert AdventOfCode2020.day5_1() == 848
  end

  test "day5_2_result" do
    assert AdventOfCode2020.day5_2() == 682
  end

  test "day6_1" do
    assert AdventOfCode2020.Days.Day6.calculate_part_1(
      "abc\n\na\nb\nc\n\nab\nac\n\na\na\na\na\n\nb"
    ) == 11
  end

  test "day6_2" do
    assert AdventOfCode2020.Days.Day6.calculate_part_2(
      "abc\n\na\nb\nc\n\nab\nac\n\na\na\na\na\n\nb"
    ) == 6
  end

  test "day6_1_result" do
    assert AdventOfCode2020.day6_1() == 6680
  end

  test "day6_2_result" do
    assert AdventOfCode2020.day6_2() == 3117
  end

  test "day7_1" do
    assert AdventOfCode2020.Days.Day7.calculate_part_1(
      "light red bags contain 1 bright white bag, 2 muted yellow bags.\ndark orange bags contain 3 bright white bags, 4 muted yellow bags.\nbright white bags contain 1 shiny gold bag.\nmuted yellow bags contain 2 shiny gold bags, 9 faded blue bags.\nshiny gold bags contain 1 dark olive bag, 2 vibrant plum bags.\ndark olive bags contain 3 faded blue bags, 4 dotted black bags.\nvibrant plum bags contain 5 faded blue bags, 6 dotted black bags.\nfaded blue bags contain no other bags.\ndotted black bags contain no other bags."
    ) == 4
  end

  test "day7_1_result" do
    assert AdventOfCode2020.day7_1() == 161
  end

  test "day7_2_1" do
    assert AdventOfCode2020.Days.Day7.calculate_part_2(
      "light red bags contain 1 bright white bag, 2 muted yellow bags.\ndark orange bags contain 3 bright white bags, 4 muted yellow bags.\nbright white bags contain 1 shiny gold bag.\nmuted yellow bags contain 2 shiny gold bags, 9 faded blue bags.\nshiny gold bags contain 1 dark olive bag, 2 vibrant plum bags.\ndark olive bags contain 3 faded blue bags, 4 dotted black bags.\nvibrant plum bags contain 5 faded blue bags, 6 dotted black bags.\nfaded blue bags contain no other bags.\ndotted black bags contain no other bags."
    ) == 32
  end

  test "day7_2_2" do
    assert AdventOfCode2020.Days.Day7.calculate_part_2(
      "shiny gold bags contain 2 dark red bags.\ndark red bags contain 2 dark orange bags.\ndark orange bags contain 2 dark yellow bags.\ndark yellow bags contain 2 dark green bags.\ndark green bags contain 2 dark blue bags.\ndark blue bags contain 2 dark violet bags.\ndark violet bags contain no other bags."
    ) == 126
  end

  test "day7_2_result" do
    assert AdventOfCode2020.day7_2() == 30899
  end

  test "day8_1" do
    assert AdventOfCode2020.Days.Day8.calculate_part_1("nop +0\nacc +1\njmp +4\nacc +3\njmp -3\nacc -99\nacc +1\njmp -4\nacc +6") == 5
  end

  test "day8_1_result" do
    assert AdventOfCode2020.day8_1() == 1782
  end

  test "day8_2" do
    assert AdventOfCode2020.Days.Day8.calculate_part_2("nop +0\nacc +1\njmp +4\nacc +3\njmp -3\nacc -99\nacc +1\njmp -4\nacc +6") == 8
  end

  test "day8_2_result" do
    assert AdventOfCode2020.day8_2() == 797
  end

  test "day9_1" do
    assert AdventOfCode2020.Days.Day9.calculate_part_1("35\n20\n15\n25\n47\n40\n62\n55\n65\n95\n102\n117\n150\n182\n127\n219\n299\n277\n309\n576", 5) == 127
  end

  test "day9_1_result" do
    assert AdventOfCode2020.day9_1() == 138879426
  end

  test "day9_2" do
    assert AdventOfCode2020.Days.Day9.calculate_part_2("35\n20\n15\n25\n47\n40\n62\n55\n65\n95\n102\n117\n150\n182\n127\n219\n299\n277\n309\n576", 5) == 62
  end

  test "day9_2_result" do
    assert AdventOfCode2020.day9_2() == 23761694
  end

  test "day10_1" do
    assert AdventOfCode2020.Days.Day10.calculate_part_1("28\n33\n18\n42\n31\n14\n46\n20\n48\n47\n24\n23\n49\n45\n19\n38\n39\n11\n1\n32\n25\n35\n8\n17\n7\n9\n4\n2\n34\n10\n3") == 220
  end

  test "day10_1_result" do
    assert AdventOfCode2020.day10_1() == 2738
  end

  test "day10_2" do
    assert AdventOfCode2020.Days.Day10.calculate_part_2("28\n33\n18\n42\n31\n14\n46\n20\n48\n47\n24\n23\n49\n45\n19\n38\n39\n11\n1\n32\n25\n35\n8\n17\n7\n9\n4\n2\n34\n10\n3") == 19208
  end

  test "day10_2_result" do
    assert AdventOfCode2020.day10_2() == 74049191673856
  end
end
