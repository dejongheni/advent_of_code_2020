defmodule AdventOfCode2020.Utils do
  def read_file fileName do
    File.read!(fileName)
  end

  def file_to_list_break_line file do
    file |> String.trim |> String.split("\n")
  end

  def file_to_list_comma file do
    file |> String.trim |> String.split(",")
  end

  def list_of_strings_to_int list do
    list |> Enum.map(fn str -> String.to_integer(str) end)
  end
end
