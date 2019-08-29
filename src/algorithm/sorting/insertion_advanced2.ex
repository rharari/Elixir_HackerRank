defmodule InsertionAdvanced2 do
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
      IO.inspect sortlr(a)
    end)
  end

  def go do
    a = 1..5 |> Enum.map(fn x -> x end) |> Enum.reverse()
    sortlr(a)
  end

  defp sortlr([_]), do: 0
  defp sortlr([h1|t]), do: sortlr(t, [], h1, 0, 0)

  defp sortlr([], _, _, acc, total), do: total + acc
  defp sortlr([h2|t], tnew, h1, acc, total) when h2 >= h1, do: sortlr(t, tnew ++ [h1], h2, acc, total)
  defp sortlr([h2|t], tnew, h1, acc, total) do
    {total2, t3} = sortrl(Enum.reverse(tnew), [], h2, 0)
    sortlr(t, t3, h1, acc + 1 + total2, total)
  end

  defp sortrl([], tnew, h, acc), do: {acc, Enum.reverse(tnew ++ [h])}
  defp sortrl([h1|t1], tnew, h, acc) when h < h1, do: sortrl(t1, tnew ++ [h1], h, acc + 1)
  defp sortrl([h1|t1], tnew, h, acc), do: {acc, Enum.reverse(tnew ++ [h] ++ [h1] ++ t1)}

end
