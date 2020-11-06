defmodule MinimumDistance do
  @moduledoc """
    HackerRank challenge
    @author: ricardo alberto harari - ricardo.harari@gmail.com
    https://www.hackerrank.com/challenges/minimum-distances/problem
  """


  def main() do
    [_n, arr] = read_values()
    get_minimum(arr, %{}, 0, -1)
    |> IO.puts
  end

  def get_minimum([], _map, _pos, distance), do: distance
  def get_minimum([h|t], map, pos, distance) do
    case Map.get(map, "#{h}") do
      nil -> get_minimum(t, Map.put(map, h, pos), pos + 1, distance)
      v -> case pos - v do
              1 -> 1
              d -> get_minimum(t, Map.put(map, h, pos), pos + 1, distance == -1 && d || min(distance, d))
           end
    end
  end

  def read_values(), do: [IO.gets(""), IO.gets("") |> String.trim |> String.split()]


end
