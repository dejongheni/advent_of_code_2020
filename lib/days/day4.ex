defmodule AdventOfCode2020.Days.Day4 do
  import AdventOfCode2020.Utils
  @enforce_keys [:byr, :iyr, :eyr, :hgt, :hcl, :ecl, :pid]
  defstruct [:byr, :iyr, :eyr, :hgt, :hcl, :ecl, :pid, :cid]

  @rules %{
      byr: 1920..2002,
      iyr: 2010..2020,
      eyr: 2020..2030,
      cm: 150..193,
      in: 59..76,
      hcl: ~r/(^\#{1}([a-f]|[0-9]){6}){1}$/,
      ecl: ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"],
      pid: 9
    }

  def calculate_part_1(input) do
    input
    |> file_to_list_blank_line()
    |> Enum.map(fn passport ->
        passport_string_to_map(passport)
        |> create_struct()
      end)
    |> Enum.filter(fn x -> x end)
    |> Enum.count
  end

  def calculate_part_2(input) do
    input
    |> file_to_list_blank_line()
    |> Enum.map(fn passport ->
        passport_string_to_map(passport)
        |> create_struct()
      end)
    |> Enum.filter(fn x -> validate_passport(x) end)
    |> Enum.count
  end

  def passport_string_to_map(passport) do
    String.split(passport, [" ", "\n"])
    |> Enum.map(fn key_value ->
      [key, value] = String.split(key_value, ":")
      {String.to_atom(key), value}
    end)
    |> Enum.into(%{})
  end

  def validate_passport(nil) do
    nil
  end

  def validate_passport(passport) do
    validate_string_in_range(passport.byr, @rules[:byr])
    && validate_string_in_range(passport.iyr, @rules[:iyr])
    && validate_string_in_range(passport.eyr, @rules[:eyr])
    && validate_height(passport.hgt)
    && validate_hair_color(passport.hcl)
    && validate_eye_color(passport.ecl)
    && validate_pid(passport.pid)
  end

  def validate_pid(pid) do
    String.length(pid) == @rules[:pid]
  end

  def validate_eye_color(eye_color) do
    eye_color in @rules[:ecl]
  end

  def validate_hair_color(hair_color) do
    String.match?(hair_color, @rules[:hcl])
  end

  def validate_height(height) do
    {hgt, unit} = Integer.parse(height)
    unit = String.to_atom(unit)
    unit in [:cm, :in] && hgt in @rules[unit]
  end

  def validate_string_in_range(string, range) do
    String.to_integer(string) in range
  end

  def create_struct(map) do
    try do
      struct!(__MODULE__, map)
    rescue
      _ -> nil
    end
  end
end
