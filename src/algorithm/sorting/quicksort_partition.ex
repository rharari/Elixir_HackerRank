defmodule QuicksortPartition do
  @moduledoc """
    HackerRank challenge
    @author: ricardo alberto harari - ricardo.harari@gmail.com
    https://www.hackerrank.com/challenges/insertionsort1/problem

    c("quicksort_partition.ex")
    """

  def run() do
    IO.gets("")
    IO.gets("") |> String.trim |> String.split |> Enum.map(&String.to_integer/1) |> partition()
  end

  def partition([h|t]), do: partition(h, t, [], [])
  defp partition(n, [], l1, l2), do: print(l1 ++ [n] ++ l2)
  defp partition(n, [h|t], l1, l2) when h < n, do: partition(n, t, [h] ++ l1, l2)
  defp partition(n, [h|t], l1, l2), do: partition(n, t, l1, [h] ++ l2)

  defp print(lst), do: IO.puts "#{lst |> Enum.join(" ")}"

end
