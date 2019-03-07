defmodule SumSquareDistance do
  @moduledoc """
  HackerRank challenge
  @author: ricardo alberto harari - ricardo.harari@gmail.com
  https://www.hackerrank.com/contests/projecteuler/challenges/euler006
  https://projecteuler.net/problem=6

  iex(1)> SumSquareDistance.run()
  """

  def run, do:
    IO.gets("") |> String.trim() |> Integer.parse |> elem(0) |> run_tests()

  defp run_tests(0), do: {:ok}
  defp run_tests(n) do
    v = IO.gets("") |> String.trim() |> Integer.parse |> elem(0)
    sum_v = 1..v |> Enum.sum
    IO.puts sum_v * sum_v - (1..v |> Enum.reduce(fn x, acc -> acc + x * x end))
    run_tests(n - 1)
  end

end