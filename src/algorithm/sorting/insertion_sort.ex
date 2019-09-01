defmodule InsertionSort do
  @moduledoc """
  HackerRank challenge
  @author: ricardo alberto harari - ricardo.harari@gmail.com
  https://www.hackerrank.com/challenges/insertionsort1/problem
  """

  def run() do
    IO.gets("")
    IO.gets("") |> String.trim |> String.split |> Enum.map(&String.to_integer/1) |> sort()
  end

  def sort(a) do
    [num|lst] = Enum.reverse(a)
    sort([], lst, num)
  end

  defp sort(lsta, [], num), do: print(lsta ++ [num])
  defp sort(lsta, [h|t], num) when num < h do
    print(lsta ++ [h] ++ [h] ++ t)
    sort(lsta ++ [h], t, num)
  end
  defp sort(lsta, [h|t], num), do: print(lsta ++ [num] ++ [h] ++ t)

  defp print(lst), do: IO.puts "#{lst |> Enum.reverse |> Enum.join(" ")}"

end
