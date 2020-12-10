# https://adventofcode.com/2020/day/9

defmodule Advent.Day9 do

  @preamble 25

  def start(part \\ :part1, file \\ "/tmp/input.txt") do
    File.read!(file)
    |> String.split()
    |> Enum.map(&String.to_integer/1)
    |> find_invalid_number(part)
  end

  defp find_sequence(v, _, acc, sum_acc) when sum_acc == v, do: Enum.max(acc) + Enum.min(acc)
  defp find_sequence(v, t, acc, sum_acc) when sum_acc > v, do: find_sequence(v, t, acc |> tl(), sum_acc - List.first(acc))
  defp find_sequence(v, [h|t], acc, sum_acc), do: find_sequence(v, t, acc ++ [h], sum_acc + h)

  defp find_invalid_number(list, :part2), do:
    find_invalid_number(list, :part1) |> find_sequence(list, [], 0)

  defp find_invalid_number(list, :part1), do: list |> Enum.split(@preamble) |> find_invalid_number()
  defp find_invalid_number({lst1, lst2}), do: [] |> get_sum(lst1) |> find_invalid_number(lst2, lst1)
  defp find_invalid_number(map_sum, lst2, lst1), do:
    Enum.reduce_while(lst2, {lst1, map_sum}, fn o, {lst, msum} ->
      case has_key?(msum, o) > 0 do
        false -> {:halt, o}
        true -> new_list = remove_last(lst)
                {:cont, { [o] ++ new_list, [get_sum(%{}, o, new_list)] ++ remove_last(msum)} }
      end
    end)

  defp has_key?(msum, value), do: Enum.find(msum, -1, fn map -> Map.has_key?(map, value) end)

  defp remove_last(lst), do: lst |> Enum.reverse() |> tl() |> Enum.reverse()

  defp get_sum(acc, [_v]), do: acc
  defp get_sum(acc, [h1|t]), do: ([get_sum(%{}, h1, t)] ++ acc) |> get_sum(t)
  defp get_sum(acc, _h1, []), do: acc
  defp get_sum(acc, h1, [h2|t]), do: get_sum(Map.put(acc, h1 + h2, 1), h1, t)

end
