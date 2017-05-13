# @author: Ricardo A Harari - ricardo.harari@gmail.com
# https://www.hackerrank.com/challenges/game-with-cells
# hacker hank - Army Game

defmodule E2b do

  def main() do go(IO.gets("") |> String.strip |> String.to_integer) end

  def go(0) do true end
  def go(t) do
    [m, n] = for n <- IO.gets("") |> String.strip |> String.split, do: String.to_integer(n)
    g = gcd(m,n)
    IO.puts "#{trunc(m/g * n/g)}"
    go(t-1)
  end

  def gcd(x, 0), do: x
  def gcd(x, y), do: gcd(y, rem(x,y))

end