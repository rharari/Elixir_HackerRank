defmodule Advent.Day7b do

  def start(file \\ "/tmp/input2.txt"), do:
    File.stream!(file)
    |> Enum.reduce(%{},
        fn line, acc -> format_map(acc, String.replace(line, ["bag", "bags", ".", "\n", "no other"], "") |> String.split(" contain"))
       end)
    |> process()
    |> elem(1)

  def process(map), do: map |> Map.get("shiny gold") |> process(map, 1, 0)

  def process(nil, _map, mult, total), do: {mult, total}
  def process(bags, map, mult, total) do
    Enum.reduce(bags, {mult, total}, fn {item, qtd}, {_, acc_total} ->
      case Map.get(map, item) do
        nil -> {mult, acc_total + mult * qtd}
        new_bags -> process(new_bags, map, mult * qtd, acc_total + mult * qtd)
      end
    end )
  end

  defp format_map(map, [_bag, "  "]), do: map
  defp format_map(map, [bag, bags]) do
    bags
    |> String.split(",")
    |> Enum.map(fn o -> String.trim(o)
            |> String.split(" ", parts: 2) end)
            |> Enum.filter(fn o -> o !== [[""]] end)
            |> Enum.reduce(map, fn [num, item], acc ->
                v = [{item, String.to_integer(num)}]
                Map.update(acc, String.trim(bag), v, fn lst -> v ++ lst end)
       end)
  end

end
