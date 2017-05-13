# @author: Ricardo A Harari - ricardo.harari@gmail.com
# https://www.hackerrank.com/challenges/game-with-cells
# hacker hank - Army Game

defmodule E2 do

  def main() do go(IO.gets("") |> String.strip |> String.to_integer) end

  def go(0) do true end
  def go(t) do
    [m, n] = for n <- IO.gets("") |> String.strip |> String.split, do: String.to_integer(n)
    [min, max] = min_max(m, n)
    square_len = calculate(min, max, trunc(min/2))
    IO.puts "#{trunc(min/square_len * max/square_len)}"
    go(t-1)
  end

  # the matrix is a square
  def calculate(min, max, _) when min == max do min end
  # minside is multiple of max side
  def calculate(min, max, _) when max/min == trunc(max/min) do min end
  # else...
  def calculate(min, max, minsqr) do findmax(minsqr, min, max) end

  # find max proper divisor between max and min using bruteforce
  def findmax(1, _, _) do 1 end
  def findmax(i, min, max) when rem(min,i) == 0 and rem(max,i) == 0 do i end
  def findmax(i, min, max) do findmax(i-1, min, max) end

  def min_max(x, y) when x < y do [x,y] end
  def min_max(x, y) do [y, x] end

end