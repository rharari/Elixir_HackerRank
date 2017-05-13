# @author: Ricardo A Harari - ricardo.harari@gmail.com
# https://www.hackerrank.com/challenges/2d-array
# hacker hank - 2D Array - DS


defmodule E1 do

  def main() do
    lst = for _ <- 1..6, do: IO.gets("") |> String.strip |> String.split |> Enum.map(&String.to_integer/1)
    IO.write max_hourglass(lst, 0, 0, -100)
  end

  def max_hourglass(_, 4, _, acc) do acc end
  def max_hourglass(lst, row, 4, acc) do max_hourglass(lst, row + 1, 0, acc) end
  def max_hourglass(lst, row, col, acc) do
    t1 = sum(Enum.at(lst, row), col) + sum(Enum.at(lst, row + 2), col) + Enum.at(Enum.at(lst, row + 1), col + 1)
    max_hourglass(lst, row, col + 1, max(acc, t1))
  end

  def sum(lst, col) do
    Enum.at(lst, col) + Enum.at(lst, col + 1) + Enum.at(lst, col + 2)
  end


end