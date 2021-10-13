defmodule LuckBalance do
  @moduledoc """
    HackerRank challenge
    @author: ricardo alberto harari - ricardo.harari@gmail.com
    https://www.hackerrank.com/challenges/luck-balance/problem

    c("luck_balance.ex")
    LuckBalance.run()

  """

  def run(), do: get_line() |> process()
  def process([n, k]) do
    1..n |> Enum.reduce({[], 0}, fn _, {arr, sum} ->
      case get_line() do
        [l, 0] -> {arr, sum + l}
        [l, _] -> {arr ++ [l], sum}
      end
    end)
    |> process(k)
  end
  def process({arr, sum}, k), do: arr |> Enum.sort(&(&1 >= &2)) |> Enum.split(k) |> process_sum(sum)
  def process_sum({l1, l2}, sum), do: Enum.sum(l1) + sum - Enum.sum(l2) |> IO.puts()
  def get_line(), do: IO.gets("") |> String.trim |> String.split |> Enum.map(&String.to_integer/1)

end
