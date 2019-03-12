defmodule RoadsLibraries do
  @moduledoc """
  HackerRank challenge
  @author: ricardo alberto harari - ricardo.harari@gmail.com
  https://www.hackerrank.com/challenges/torque-and-development/problem

  iex(1)> RoadsLibraries.run()

  #TODO: fail one test by performance, must improve!
  suggestion:
    implement deep first search from scratch, also flagging visited vertex
    avoid length(array) this traverses all elements
    try another approach that do not add all vertex ( :digraph.add_vertex )
  """
  def run, do:
    IO.gets("") |> String.trim() |> Integer.parse |> elem(0)
    |> run_test()

  def run_test(0), do: {:ok}
  def run_test(q) do
    IO.gets("") |> String.trim |> String.split |> Enum.map(&String.to_integer/1)
      |> calculate() |> IO.puts
    run_test(q - 1)
  end

  defp calculate([1, _, clib, _]), do: clib
  defp calculate([n, 0, clib, _]), do: clib * n
  defp calculate([n, m, clib, crod]) when clib <= crod do
    1..m |> Enum.each(fn _ -> IO.gets("") end)
    clib * n
  end
  defp calculate([n, m, clib, crod]) do
    g = :digraph.new
    1..n |> Enum.each(fn x -> :digraph.add_vertex(g, x |> to_string) end)
    1..m |> Enum.each(fn _ ->
      [v1, v2] = IO.gets("") |> String.trim |> String.split
      :digraph.add_edge(g, v1, v2)
      :digraph.add_edge(g, v2, v1)
    end)
    arr = :digraph_utils.strong_components(g)
    length(arr) * clib + Enum.reduce(arr, 0, fn x, acc -> acc + length(x) - 1 end) * crod
  end

end