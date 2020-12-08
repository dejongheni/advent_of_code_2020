defmodule AdventOfCode2020.Days.Day7 do
  import AdventOfCode2020.Utils

  def calculate_part_1(input) do
    input
    |> file_to_list_break_line()
    |> parse_rules()
    |> count_golden()
  end

  def calculate_part_2(input) do
    input
    |> file_to_list_break_line()
    |> parse_rules()
    |> count_golden_content()
  end

  def parse_rules(list_of_rules) do
    Enum.map(list_of_rules, fn str ->
      [bag_type | content] =
        String.split(str, ["contain", ","], trim: true)
        |> Enum.map(fn x -> String.replace(x, ["bags", "bag", "."], "") |> String.trim() end)
      content =
        Enum.map(content, fn x ->
          [nb_of_bags, color] = String.split(x, " ", parts: 2)
          nb_of_bags = if nb_of_bags == "no", do: 0, else: String.to_integer(nb_of_bags)
          {color, nb_of_bags}
        end)
        |> Enum.reject(&(elem(&1, 1) == 0))
        |> Enum.into(%{})
      {bag_type, content}
    end)
    |> Enum.into(%{})
  end

  def count_golden(map_of_rules) do
    Enum.map(map_of_rules, fn {bag, content} ->
      {bag, generate_rule_childs(map_of_rules, content)}
    end)
    |> Enum.filter(fn {_bag, {_qty, childs}} ->  Enum.any?(childs, &(elem(&1, 0) == "shiny gold")) end)
    |> Enum.count()
  end

  def count_golden_content(map_of_rules) do
    {nb_of_bags, _contents} =
      Enum.map(map_of_rules, fn {bag, content} ->
        {bag, generate_rule_childs(map_of_rules, content)}
      end)
      |> Enum.into(%{})
      |> Map.get("shiny gold")
    nb_of_bags - 1
  end

  def generate_rule_childs(map_of_rules, content) do
    content = Map.to_list(content)
    generate_rule_childs(map_of_rules, content, [], 1)
  end

  def generate_rule_childs(map_of_rules, [{bag, count} | content], possible_bags, total) do
    bags = map_of_rules[bag]
    {nb_child, childs} = generate_rule_childs(map_of_rules, bags)
    count = total + count * nb_child
    generate_rule_childs(map_of_rules, content, possible_bags ++ [{bag, count}] ++ childs, count)
  end

  def generate_rule_childs(_, [], possible_bags, count) do
    {count, possible_bags}
  end
end
