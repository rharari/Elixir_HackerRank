defmodule SherlockPermutation do
  @moduledoc """
  HackerRank challenge
  @author: ricardo alberto harari - ricardo.harari@gmail.com
  https://www.hackerrank.com/challenges/sherlock-and-permutations/problem

  c("sherlock_permutation.ex")
  """

  def run() do
    t = IO.gets("") |> String.trim() |> Integer.parse |> elem(0)
    1..t |> Enum.each(fn _ ->
      [n,m] = IO.gets("") |> String.trim |> String.split |> Enum.map(&String.to_integer/1)
      IO.puts rem(permutation(n, m-1), 1000000007)
    end)
  end

  def permutation(_, 0), do: 1
  def permutation(n,m), do: factorial(n + m)/(factorial(n) * factorial(m)) |> Kernel.trunc

  def factorial(0), do: 1
  def factorial(n), do: Enum.reduce(1..n, &*/2)

end
