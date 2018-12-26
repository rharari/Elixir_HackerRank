defmodule PickingNumbers do
  @moduledoc """
  HackerRank challenge
  @author: ricardo a. harari - ricardo.harari@gmail.com
  https://www.hackerrank.com/challenges/picking-numbers/problem

  iex(1)> PickingNumbers.run()
  """

  def run() do
    IO.gets("")
    lst = IO.gets("") |> String.trim |> String.split |> Enum.map(&String.to_integer/1)
    grp = Enum.group_by(lst, fn x -> x end)
    [k1|keys] = Map.keys(grp)
    find_max(k1, keys, grp, length(grp[k1])) |> IO.puts
  end

  defp find_max(_, [], _, acc), do: acc
  defp find_max(k1, [k2|t2], grp, acc) when k2 - k1 > 1, do: find_max(k2, t2, grp, max( max(acc, length(grp[k1])), length(grp[k2])) )
  defp find_max(k1, [k2|t2], grp, acc), do: find_max(k2, t2, grp, max(acc, length(grp[k1]) + length(grp[k2])))

end
