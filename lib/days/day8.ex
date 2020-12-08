defmodule AdventOfCode2020.Days.Day8 do
  import AdventOfCode2020.Utils

  def calculate_part_1(input) do
    program =
      input
      |> file_to_list_break_line()
      |> parse()
    {res, _, _} = run_program(program, hd(program), 0, 0, [])
    res
  end

  def calculate_part_2(input) do
    program =
      input
      |> file_to_list_break_line()
      |> parse()
    case run_program(program, hd(program), 0, 0, []) do
      {res, _, :ok} -> res
      {_, all_passed_through, :error} -> brute_debug(program, all_passed_through)
    end
  end

  def parse(list_of_strings) do
    Enum.map(list_of_strings, fn str ->
      [action, value] = String.split(str, " ", trim: true)
      <<operator::binary-size(1), value::binary>> = value
      func =
        case operator do
          "+" -> &+/2
          "-" -> &-/2
          _ -> &return_first/2
        end
      {action, String.to_integer(value), func, false}
    end)
  end

  def return_first(x, _), do: x

  def run_program(program, instruction = {"nop", value, func, false}, pos, acc, all_passed_through) do
    next_instruction = Enum.at(program, pos+1)
    program = List.replace_at(program, pos, {"nop", value, func, true})
    run_program(program, next_instruction, pos+1, acc, [{instruction, pos}]++all_passed_through)
  end

  def run_program(program, instruction = {"acc", value, func, false}, pos, acc, all_passed_through) do
    next_instruction = Enum.at(program, pos+1)
    program = List.replace_at(program, pos, {"acc", value, func, true})
    acc = func.(acc, value)
    run_program(program, next_instruction, pos+1, acc, [{instruction, pos}]++all_passed_through)
  end

  def run_program(program, instruction = {"jmp", value, func, false}, pos, acc, all_passed_through) do
    new_pos = func.(pos, value)
    next_instruction = Enum.at(program, new_pos)
    program = List.replace_at(program, pos, {"jmp", value, func, true})
    run_program(program, next_instruction, new_pos, acc, [{instruction, pos}]++all_passed_through)
  end

  def run_program(_, {_, _, _, true}, _, acc, all_passed_through) do
    {acc, all_passed_through, :error}
  end

  def run_program(_, nil, _, acc, all_passed_through) do
    {acc, all_passed_through, :ok}
  end

  def brute_debug(program, all_passed_through) do
    all_passed_through =
      Enum.filter(all_passed_through, fn {x,_} ->
        elem(x, 0) in ["jmp", "nop"]
      end)
    Enum.find_value(all_passed_through, fn {_, pos} ->
      program =
        List.update_at(program, pos, fn {inst, value, func, _} ->
          case inst do
            "jmp" -> {"nop", value, func, false}
            "nop" -> {"jmp", value, func, false}
          end
        end)
      case run_program(program, hd(program), 0, 0, []) do
        {res, _, :ok} -> res
        {_, _, :error} -> nil
      end
    end)
  end
end
