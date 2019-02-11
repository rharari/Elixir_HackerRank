defmodule Kaprekar do
  @moduledoc """
  HackerRank challenge
  @author: ricardo alberto harari - ricardo.harari@gmail.com
  https://www.hackerrank.com/challenges/kaprekar-numbers/problem

  iex(1)> Kaprekar.run()
  """

  def run, do: verify(read_integer(), read_integer(), []) |> print_result()

  defp print_result([]), do: IO.puts "INVALID RANGE"
  defp print_result(arr), do: Enum.join(arr, " ") |> IO.puts

  defp read_integer, do: IO.gets("") |> String.trim() |> Integer.parse |> elem(0)

  defp verify(n, q, acc) when n > q, do: acc
  defp verify(n, q, acc) do
    n2_str = "#{:math.pow(n, 2) |> round}"
    {v1, v2} = String.split_at(n2_str, String.length(n2_str) - String.length("#{n}"))
    verify(n + 1, q, get_integer(v1) + get_integer(v2) == n && acc ++ [n] || acc)
  end

  defp get_integer(""), do: 0
  defp get_integer(v), do: String.to_integer(v)

end