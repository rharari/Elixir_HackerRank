defmodule InsertionAdvanced5 do
  @moduledoc """
  HackerRank challenge
  @author: ricardo alberto harari - ricardo.harari@gmail.com
  https://www.hackerrank.com/challenges/insertion-sort/problem

  good performance but still fail 2 test case - solved in java using same algorithm
  """

  use Bitwise

  @max_size 10000000

  def run() do
    t = IO.gets("") |> String.trim() |> Integer.parse |> elem(0)
    1..t |> Enum.each(fn _ ->
      IO.gets("")
      a = IO.gets("") |> String.trim |> String.split |> Enum.map(&String.to_integer/1)
      IO.inspect sort(a)
    end)
  end

  def sort(arr) do
    {total, _tmp} = get_total(arr, 0, 0, :array.new(@max_size, {:default, 0}))
    total
  end

  defp get_total([], _, acc, tmp), do: {acc, tmp}
  defp get_total([h|t], i, acc, tmp) do
    {tmp2, v} = query(tmp, h)
    get_total(t, i + 1, acc + i - v, tmp2)
  end

  defp query(arr, i) do
    {arr2, s} = query_1(0, arr, i)
    query_2(s, arr2, i)
  end

  defp query_1(acc, arr, i) when i <= 0, do: {arr, acc}
  defp query_1(acc, arr, i) do
    query_1(acc + :array.get(i, arr), arr, i &&& (i - 1))
  end

  defp query_2(acc, arr, i) when i >= @max_size, do: {arr, acc}
  defp query_2(acc, arr, i) do
    v = :array.get(i, arr)
    query_2(acc, :array.set(i, v + 1, arr), i + (i &&& -i))
  end

end
