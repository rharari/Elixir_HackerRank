# https://adventofcode.com/2020/day/7

defmodule Advent.Day7 do

  def start(file \\ "/tmp/input2.txt") do
    File.stream!(file)
    |> Enum.reduce({%{}, %{}}, fn line, acc -> process(acc, String.replace(line, ["bag", "bags", ".", "\n", "no other"], "")) end)
    |> process_contain()
    |> Map.keys
    |> length
  end

  def process_contain({contain, not_contain}) do
    contain
    |> Map.keys()
    |> find_gold_bag(contain, not_contain)
  end

  def find_gold_bag([], contain, _), do: contain
  def find_gold_bag([h|t], contain, not_contain) do
    case Map.get(not_contain, h) do
      nil -> find_gold_bag(t, contain, not_contain)
      list -> find_gold_bag(t,
                  Enum.reduce(list, contain,
                  fn {item, _}, acc ->
                    case Map.has_key?(acc, item) do
                      true -> acc
                      false -> find_gold_bag([h] ++ Map.keys(contain), Map.put(acc, item, 1), not_contain)
                    end
                  end), not_contain)
    end
  end

  defp process({contain_map, not_contain_map}, line) do
    [bag, bags] = String.split(line, " contain")
    list_bags = bags |> String.split(",") |> Enum.map(fn o -> String.trim(o) |> String.split(" ", parts: 2) |> Enum.at(1) end)
    process(contain_map, not_contain_map, String.trim(bag), list_bags, Enum.member?(list_bags, "shiny gold"))
  end

  def process(contain_map, not_contain_map, bag, _list_bags, true), do: {Map.put(contain_map, bag, 1), not_contain_map}

  def process(contain_map, not_contain_map, bag, list_bags, false), do:
    {contain_map, Enum.reduce(list_bags, not_contain_map, fn item, acc -> Map.update(acc, item, %{bag => 1}, fn o -> Map.put(o, bag, 1) end) end)}

end
