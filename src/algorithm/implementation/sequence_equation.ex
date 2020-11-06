defmodule SequenceEquation do
  @moduledoc """
    HackerRank challenge
    @author: ricardo alberto harari - ricardo.harari@gmail.com
    https://www.hackerrank.com/challenges/permutation-equation/problem
  """

  def main() do
    [n, arr] = read_values()
    arr
    |> index(1, %{})
    |> print(1, n)
  end

  def print(_p, x, n) when x > n, do: :ok
  def print(p, x, n) do
    IO.puts(p[p[x]])
    print(p, x + 1, n)
  end

  def index([], _pos, acc), do: acc
  def index([h|t], pos, acc), do: index(t, pos + 1, Map.put(acc, h, pos))

  def read_values(), do:
    [IO.gets("") |> String.trim() |> Integer.parse |> elem(0),
     IO.gets("") |> String.trim |> String.split |> Enum.map(&String.to_integer/1)
    ]

end
