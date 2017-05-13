# @author: Ricardo A Harari - ricardo.harari@gmail.com
# https://www.hackerrank.com/challenges/crush
# hacker hank - Algorithmic Crush

defmodule E2 do
  def main() do
    [n,m] = IO.gets("") |> String.strip |> String.split |> Enum.map(&String.to_integer/1)
    lst = :array.to_list(process(:array.new(n + 2, {:default,0}), m))
    IO.write maxelement(lst, 0, 0)
  end

  def maxelement([], _, x) do x end
  def maxelement([h|t], acc, x) do
    acc2 = acc + h
    maxelement(t, acc2, max(x, acc2))
  end

  def process(lst, 0) do lst end
  def process(lst, m) do
    [a,b,k] = IO.gets("") |> String.strip |> String.split |> Enum.map(&String.to_integer/1)
    process(:array.set(b + 1, :array.get(b + 1, lst) - k, :array.set(a, k +  :array.get(a, lst), lst)), m - 1)
  end

end