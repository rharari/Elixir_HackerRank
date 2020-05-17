defmodule Equal do
  @moduledoc """
    HackerRank challenge
    @author: ricardo alberto harari - ricardo.harari@gmail.com
    https://www.hackerrank.com/challenges/equal/problem

    c("equal.ex")
    Equal.run()
  """

  def run() do
    t = IO.gets("") |> String.trim() |> Integer.parse |> elem(0)
    1..t |> Enum.each(fn _ ->
      IO.gets("") # skip
      num = IO.gets("") |> String.trim |> String.split |> Enum.map(&String.to_integer/1)
      IO.inspect calculate(num)
    end)
  end

  def calculate(list) do
    min = Enum.min(list)
    min..min-4 |> Enum.reduce(1000000000000000, fn i, acc -> i |> calculate(list) |> min(acc) end)
  end

  def calculate(min, list), do:
    Enum.reduce(list, 0, fn v, acc ->
      d = v - min
      x = div(d, 5)
      acc + d - 4 * x - div(d - x * 5, 2)
    end)

end