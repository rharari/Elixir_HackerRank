defmodule FairRations do
  @moduledoc """
  HackerRank challenge
  @author: ricardo alberto harari - ricardo.harari@gmail.com
  https://www.hackerrank.com/challenges/fair-rations/problem

  iex(1)> FairRations.run()
  """

  require Integer

  def run do
    IO.gets("")
    IO.gets("") |> String.trim |> String.split |> Enum.map(&String.to_integer/1)
    |> count_breads(0, 0)
  end

  defp count_breads([], 1, _), do: IO.puts "NO"
  defp count_breads([], 0, acc), do: IO.puts acc
  defp count_breads([h|t], n, acc) when Integer.is_even(h + n), do: count_breads(t, 0, acc)
  defp count_breads([_|t], _, acc), do: count_breads(t, 1, acc + 2)

end