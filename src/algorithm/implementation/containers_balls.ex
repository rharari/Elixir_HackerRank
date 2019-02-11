defmodule ContainersBalls do
  @moduledoc """
  HackerRank challenge
  @author: ricardo alberto harari - ricardo.harari@gmail.com
  https://www.hackerrank.com/challenges/organizing-containers-of-balls/problem

  iex(1)> ContainersBalls.run()
  """

  def run do
    q = IO.gets("") |> String.trim() |> Integer.parse |> elem(0)
    1..q |> Enum.each(fn _ -> process() end)
  end

  defp process() do
    n = IO.gets("") |> String.trim() |> Integer.parse |> elem(0)
    matrix = 1..n |> Enum.map(fn _ -> IO.gets("") |> String.trim |> String.split |> Enum.map(&String.to_integer/1) end)
    containers_capacity = matrix |> Enum.map(fn row -> row |> Enum.sum() end) |> Enum.sort()
    balls_count = matrix |> sum_cols([]) |> Enum.sort()
    verify_containers(containers_capacity, balls_count)
  end

  defp verify_containers([], _), do: IO.puts "Possible"
  defp verify_containers([h1|_], [h2|_]) when h1 != h2, do: IO.puts "Impossible"
  defp verify_containers([_|t1], [_|t2]), do: verify_containers(t1, t2)

  defp sum_cols([h|t], []), do: sum_cols(t, h)
  defp sum_cols([], acc), do: acc
  defp sum_cols([h|t], acc), do: sum_cols(t, sum_col(h, acc, []))

  defp sum_col([], _, sum), do: sum
  defp sum_col([h1|t1], [h2|t2], sum), do: sum_col(t1, t2, sum ++ [h1 + h2])

end