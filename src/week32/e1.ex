# @author: Ricardo A Harari - ricardo.harari@gmail.com
# https://www.hackerrank.com/contests/w32/challenges/duplication
# hacker hank - week of code 32

defmodule E1 do
  def main() do go(IO.gets("") |> String.strip |> String.to_integer, fillArray([0])) end

  def go(0, _) do true end
  def go(n, lst) do
    i = IO.gets("") |> String.strip |> String.to_integer
    IO.puts Enum.at(lst, i)
    go(n-1, lst)
  end

  def fillArray(lst) do
    lst2 = lst ++ inverse(lst, [])
    case length(lst2) > 1000 do
      true -> lst2
      false -> fillArray(lst2)
    end
  end

  def inverse([], acc) do acc end
  def inverse([h|t], acc) do
    inverse(t, acc ++ [abs(h-1)])
  end

end