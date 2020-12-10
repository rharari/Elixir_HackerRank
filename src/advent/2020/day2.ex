# https://adventofcode.com/2020/day/2
defmodule Advent.Day2 do
  import String, only: [split: 2, to_integer: 1, at: 2]

  def start(part, file \\ "/tmp/data.txt") do
    File.read!(file)
    |> String.split("\n")
    |> Enum.reduce(0, fn line, acc -> acc + is_valid(line, part) end)
  end

  defp is_valid(line, _part) when line in ["", nil], do: 0
  defp is_valid(line, :part1) do
    [min, max, letter, _, passwd] = split(line, ["-", " ", ":"])
    <<word::utf8>> = letter
    count = Enum.count(to_charlist(passwd), fn x -> x == word end)
    ((to_integer(min) <= count) and (count <= to_integer(max))) && 1 || 0
  end
  defp is_valid(line, :part2) do
    [p1, p2, letter, _, passwd] = split(line, ["-", " ", ":"])
    case {at(passwd, to_integer(p1) - 1) == letter, at(passwd, to_integer(p2) - 1) == letter} do
       {true, false} -> 1
       {false, true} -> 1
       _ -> 0
    end
  end

end
