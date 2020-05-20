defmodule MinimumAbsDifference do
  @moduledoc """
    HackerRank challenge
    @author: ricardo alberto harari - ricardo.harari@gmail.com
    https://www.hackerrank.com/challenges/minimum-absolute-difference-in-an-array/problem

    c("minimum_abs_difference.ex")
    MinimumAbsDifference.run()

  """

  def run() do
    IO.gets("") # skip
    IO.gets("")
        |> String.trim
        |> String.split
        |> Enum.map(&String.to_integer/1)
        |> Enum.sort()
        |> calculate()
        |> IO.inspect()
  end

  def calculate([h1,h2|t]), do: calculate(t, h2, abs(h2 - h1))
  def calculate(_, _, 0), do: 0
  def calculate([], _, acc), do: acc
  def calculate([h1|t], h0, acc), do: calculate(t, h1, min(acc, abs(h1 - h0)))

end