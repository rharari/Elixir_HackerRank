defmodule InsertionAdvanced do
  @moduledoc """
  HackerRank challenge
  @author: ricardo alberto harari - ricardo.harari@gmail.com
  https://www.hackerrank.com/challenges/insertion-sort/problem

  work but bad perfomance
  """

  def run() do
    t = IO.gets("") |> String.trim() |> Integer.parse |> elem(0)
    1..t |> Enum.each(fn _ ->
      IO.gets("")
      a = IO.gets("") |> String.trim |> String.split |> Enum.map(&String.to_integer/1)
      IO.inspect sort(a)
    end)
  end

  defp sort([_]), do: 0
  defp sort([h1|t]) do
    sort(t, [], h1, 0, 0)
  end

  defp sort([], _, _, 0, total), do: total
  defp sort([], [h1|t], h, acc, total) do
    sort(t ++ [h], [], h1, 0, total + acc)
  end
  defp sort([h2|t], tnew, h1, acc, total) when h2 >= h1 do
    sort(t, tnew ++ [h1], h2, acc, total)
  end
  defp sort([h2|t], tnew, h1, acc, total) do
    sort(t, tnew ++ [h2], h1, acc + 1, total)
  end

end
