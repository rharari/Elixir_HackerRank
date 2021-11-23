defmodule AngryProfessor do
  @moduledoc """
  HackerRank challenge
  @author: ricardo a. harari - ricardo.harari@gmail.com
  https://www.hackerrank.com/challenges/angry-professor/problem
  """

  def run() do
    Enum.each(1..read_integer(), fn _ ->
      [n, k] = read_array_int()
      read_array_int() |> Enum.count(fn o -> o <= 0 end) |> print(k)
    end)
  end

  def print(t, k) when t < k, do: IO.puts("YES")
  def print(_, _), do: IO.puts("NO")

  def read_array_int(), do: IO.gets("") |> String.trim |> String.split |> Enum.map(&String.to_integer/1)
  def read_integer(), do: IO.gets("") |> String.trim() |> Integer.parse |> elem(0)

end
