defmodule FlatlandSpace do
  @moduledoc """
    HackerRank challenge
    @author: ricardo alberto harari - ricardo.harari@gmail.com
    https://www.hackerrank.com/challenges/flatland-space-stations/problem
  """

  def main() do
    [ [n, m], arr] = [IO.gets("") |> String.trim |> String.split |> Enum.map(&String.to_integer/1), IO.gets("") |> String.trim |> String.split |> Enum.map(&String.to_integer/1)]
    case n == m do
      true -> IO.puts(0)
      false -> arr |> Enum.sort() |> find_max_distance(n - 1) |> IO.puts()
    end
  end

  def find_max_distance([p], n), do: max(p, n - p)
  def find_max_distance(arr = [h|_], n), do: h |> find_max_distance(arr, n) |> max(n - List.last(arr))
  def find_max_distance(v, [], _n), do: v
  def find_max_distance(v, [_h|[]], _n), do: v
  def find_max_distance(v, [h1, h2|t], n), do: v |> max(div(h2 - h1, 2)) |> find_max_distance([h2] ++ t, n)

end
