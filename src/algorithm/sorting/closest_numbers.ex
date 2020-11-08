defmodule ClosestNumbers do
  @moduledoc """
    HackerRank challenge
    @author: ricardo alberto harari - ricardo.harari@gmail.com
    https://www.hackerrank.com/challenges/closest-numbers/problem

    c("closest_numbers.ex")
  """

  def main() do
    IO.gets("")
    IO.gets("")
      |> String.trim
      |> String.split
      |> Enum.map(&String.to_integer/1)
      |> Enum.sort()
      |> find_closest()
      |> Enum.join(" ")
      |> IO.puts()
  end

  def find_closest([h|t]), do: find_closest(h, t, 10000001, [])

  def find_closest(_, [], _, acc), do: acc
  def find_closest(h1, [h2|t], min_value, acc) when abs(h2 - h1) > min_value, do: find_closest(h2, t, min_value, acc)
  def find_closest(h1, [h2|t], min_value, acc) when abs(h2 - h1) == min_value, do: find_closest(h2, t, min_value, acc ++ [h1, h2])
  def find_closest(h1, [h2|t], min_value, _acc) when abs(h2 - h1) < min_value, do: find_closest(h2, t, abs(h2 - h1), [h1, h2])

end
