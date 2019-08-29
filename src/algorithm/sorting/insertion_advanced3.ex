defmodule InsertionAdvanced3 do
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
      IO.inspect sort(Enum.sort(a), a, 0)
    end)
  end


  defp sort([], _, acc), do: acc
  defp sort([h0|t0], t1, acc) do
    {acc2, tnew} = find(h0, t1, [], 0)
    sort(t0, tnew, acc + acc2)
  end

  defp find(h0, [h1|t1], tnew, acc) when h0 == h1 do
    {acc, tnew ++ t1 |> IO.inspect}
  end
  defp find(h0, [h1|t1], tnew, acc) do
    find(h0, t1, tnew ++ [h1], acc + 1)
  end

end
