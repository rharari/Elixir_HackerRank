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
    containers_capacity = matrix |> Enum.map(fn row -> row |> Enum.sum() end) |> Enum.sort() |> IO.inspect
    balls_count = matrix |> sum_cols([])
  end

  def sum_cols([h|t], []), do: sum_cols(t, [h])
    # TODO !
  end

end