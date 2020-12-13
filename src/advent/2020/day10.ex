defmodule Advent.Day10 do

  def start(part \\ :part1, file \\ "/tmp/input.txt"), do:
    File.read!(file)
    |> String.split()
    |> Enum.map(&String.to_integer/1)
    |> Enum.sort()
    |> execute(part)

  defp execute(lst, :part1), do:
    lst
    |> Enum.reduce({0, %{3 => 1}}, fn o, {last, m} -> {o, Map.update(m, o - last, 1, fn x -> x + 1 end)} end)
    |> elem(1)
    |> print()

  defp execute(lst, :part2) do
    lst
    |> Enum.reduce(%{0 => 1}, fn o, acc -> acc |> Map.put(o, 0) |> update(o, -3) |> update(o, -2) |> update(o, -1) end)
    |> print(List.last(lst))
  end

  def update(acc, v, delta) do
    case acc[v + delta] do
      nil -> acc
      delta_v -> Map.update(acc, v, 1, fn x -> x + delta_v end)
    end
  end

  defp print(m), do: m[1] * m[3] # part1
  defp print(m, n), do: m[n] # part2

end
