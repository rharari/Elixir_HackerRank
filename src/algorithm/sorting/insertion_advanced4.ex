defmodule InsertionAdvanced4 do
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
      IO.inspect sort(a, 0)
    end)
  end

  def sort([], acc), do: acc
  def sort([h0|t0], acc), do: sort(t0, acc + count(t0, h0, 0))

  defp count([], _, acc), do: acc
  defp count([h|t], h0, acc) when h0 > h, do: count(t, h0, acc + 1)
  defp count([_|t], h0, acc), do: count(t, h0, acc)

end
