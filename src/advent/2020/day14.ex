defmodule Advent.Day14 do

  def start(part \\ :part1, file \\ "/tmp/input.txt"), do:
    file |> File.read!() |> String.split(["\n"]) |> Enum.reduce({part, nil, %{}}, &process_command/2) |> elem(2) |> Map.values() |> Enum.sum()

  defp process_command(["mask", _, mask], {part, _, mem}), do: {part, mask |> to_charlist() |> Enum.reverse(), mem}
  defp process_command([mem_addr, _, value_str], {:part1, mask, mem}), do:
    value_str |> String.to_integer() |> Integer.to_string(2) |> to_charlist() |> Enum.reverse() |> apply_mask(mask, "", :part1) |> store_mem(mem, mem_addr, mask, :part1)
  defp process_command([mem_addr, _, value_str], {:part2, mask, mem}), do:
    mem_addr |> get_mem_addr() |> Integer.to_string(2) |> to_charlist() |> Enum.reverse() |> apply_mask(mask, "", :part2) |> to_charlist()
    |> generate_mask([[]]) |> store_mem(mask, mem, String.to_integer(value_str), :part2)
  defp process_command("", acc), do: acc
  defp process_command(line, acc), do: process_command(String.split(line), acc)

  defp store_mem(new_value, mem, mem_addr, mask, :part1), do: {:part1, mask, Map.put(mem, mem_addr, new_value)}
  defp store_mem(mem_addrs, mask, mem, new_value, :part2), do: {:part2, mask, mem_addrs |> Enum.reduce(mem, fn addr, acc -> Map.put(acc, addr, new_value) end) }

  defp apply_mask(_, [], acc, :part2), do: acc
  defp apply_mask(_, [], acc, _), do: String.to_integer(acc, 2)
  defp apply_mask([], [49|t2], acc, part), do: apply_mask([], t2, <<49>> <> acc, part)
  defp apply_mask([], [_v|t2], acc, :part1), do: apply_mask([], t2, <<48>> <> acc, :part1)
  defp apply_mask([], [v|t2], acc, :part2), do: apply_mask([], t2, <<v>> <> acc, :part2)
  defp apply_mask([h|t], [?X|t2], acc, :part1), do: apply_mask(t, t2, <<h>> <> acc, :part1)
  defp apply_mask([_h|t], [?X|t2], acc, :part2), do: apply_mask(t, t2, <<?X>> <> acc, :part2)
  defp apply_mask([h|t], [h2|t2], acc, :part2), do: apply_mask(t, t2, <<max(h, h2)>> <> acc, :part2)
  defp apply_mask([_h|t], [h2|t2], acc, part), do: apply_mask(t, t2, <<h2>> <> acc, part)

  defp get_mem_addr(v), do: String.replace(v, ["mem[", "]"], "") |> String.to_integer()

  defp generate_mask([], acc), do: acc
  defp generate_mask([?X|t], acc), do: generate_mask(t, Enum.map(acc, &[?1 | &1])) ++ generate_mask(t, Enum.map(acc, &[?0 | &1]))
  defp generate_mask([n|t], acc), do: generate_mask(t, Enum.map(acc, &[n | &1]))

end
